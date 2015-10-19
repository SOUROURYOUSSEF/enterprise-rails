# Add code to extend base Rails controller for application specific functionality.
# 1. Enable all access to Rails with Authentication
# 2. Configure logging parameters.
# 3. Add filter to log all actions for auditing purpose

ActionController::Base.class_eval do

  before_filter :authenticate_user!
  before_filter :configure_logger
  after_filter  :log_action

  attr_reader :logger

  protected

  # Configure logging parameters
  def configure_logger
    @logger = Logging.logger[self]
    request.params[:start_time] = Time.now
    Logging.mdc['ip_address'] = request.remote_ip
    Logging.mdc['session_id'] = (request.session_options[:id] if request.session_options != nil)
    Logging.mdc['user_id'] = (current_user.id if current_user != nil)
    logger.debug 'Chorus logger initialized'
  end

  def log_action
    req_hash = serialize_request(request)
    logger.audit "#{req_hash.to_json}"
  end

  def serialize_request(request)
    request_hash = {
        :request => {
            :session_id => (request.session_options[:id] if request.session_options != nil),
            :user_id => (current_user.id if current_user != nil),
            :user_name => (current_user.first_name + ' ' + current_user.last_name if current_user != nil),
            :url => request.url,
            :method => request.method,
            :remote_ip => request.remote_ip,
            :params => request.parameters.clone
        },
        :response => {
            :status => response.status,
            :message => response.message,
            :content_type => response.content_type,
            :elapsed_time => Time.now - request.params[:start_time],
            :body => (response.body if response.content_type == 'text/json')
        }
    }
    request_hash
  end

end
