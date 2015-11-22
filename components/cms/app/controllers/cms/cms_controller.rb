require 'net/http'

class Cms::CmsController < Cms::ApplicationController
  # NOTE: temp. skip authentication. Need to provide token in request header for processing form data
  skip_before_filter :authenticate_user!

  respond_to :html, :js, :json

  before_filter  :prepare_cms

  def index

    respond_with()

  end

  def retrieve
    model= params[:model]
    page_no = params[:page_no] == '' ? 1 : params[:page_no].to_i

    if model == nil || model == ''
      # throw RECORD NOT FOUND EXCEPTION
      logger.error('Model name must be provided.')
    end
    uri = URI("#{@cms_url}/#{model}.json?page=#{page_no}&auth_token=#{APP_CONFIG['locomotive']['auth_token']}")
    result = Net::HTTP.get(uri)

    render :json => result

  end


  # Create new content entry into locomotive CMS for a given model
  def create
    model = params[:model]
    #NOTE: Pay attention how the data is passed as a hash. This is how locomotive expects it. Not obvious.
    #    req.set_form_data('content_entry[name]' => data['name'], 'content_entry[summary]' => data['summary'], 'model' => model)
    form_data = {}
    params[:content_entry].each do |key,val|
      form_data["content_entry[#{key}]"] = val
    end
    #data = params[:content_entry]

    uri = URI("#{@cms_url}/locomotive/api/content_types/#{model}/entries.json?auth_token=#{APP_CONFIG['locomotive']['auth_token']}")

    req = Net::HTTP::Post.new(uri)
    req.set_form_data(form_data)
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end
    case res
      when Net::HTTPSuccess, Net::HTTPRedirection
        render :json => res.body
      else
        # examine response code and generate appropriate error message
        render :json => res.value
    end

  end

  def update
    id = params[:id]
    model = params[:model]
    #NOTE: Pay attention how the data is passed as a hash. This is how locomotive expects it. Not obvious.
    #    req.set_form_data('content_entry[name]' => data['name'], 'content_entry[summary]' => data['summary'], 'model' => model)
    form_data = {}
    params[:content_entry].each do |key,val|
     form_data["content_entry[#{key}]"] = val
    end
    #data = params[:content_entry]

    uri = URI("#{@cms_url}/locomotive/api/content_types/#{model}/entries/#{id}.json?auth_token=#{APP_CONFIG['locomotive']['auth_token']}")

    req = Net::HTTP::Put.new(uri)
    req.set_form_data(form_data)
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end
    case res
      when Net::HTTPSuccess, Net::HTTPRedirection
        render :json => res.body
      else
        # examine response code and generate appropriate error message
        render :json => res.value
    end

  end

  def edit

  end

  def new

  end

  def show

  end

  def delete

  end

  def destroy

  end


  private

  def prepare_cms
    @cms_url = "http://#{APP_CONFIG['locomotive']['host']}:#{APP_CONFIG['locomotive']['port']}"
  end

end

