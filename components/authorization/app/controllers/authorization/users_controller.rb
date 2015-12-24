class Authorization::UsersController < Authorization::ApplicationController

  respond_to :html, :js, :json

  def index
    # handling Ajax data table filtering, search and sort for JQuery dataTables
    @limit = params[:length] == nil ? 10 : params[:length].to_i
    @offset = params[:start] == nil ? 0 : params[:start].to_i
    @draw = params[:draw] == nil ? 1 : params[:draw].to_i
    @search = params[:search] == nil ? nil : params[:search][:value]
    @order = params[:order] == nil ? 0 : params[:order]['0'][:column]
    @direction = params[:order] == nil ? 0 : params[:order]['0'][:dir]
    @order_column = params[:columns] == nil ? 'created_at' :params[:columns][@order][:data]
    @total = User.count
    puts "total = #{@total}"
    if @search == nil || @search == ''
      logger.debug "------------ retrieving users from database"
      @users = User.limit(@limit).offset(@offset).order("#{@order_column} #{@direction}").includes(:groups)
      @filteredCount = User.count
    else
      # NOTE: Use Solr search only if model is enables with Solr search option.
      if User.respond_to?("searchable?") && User.searchable?
        # NOTE: Following local variables are needed because Sunspot Solr block below executes in a different context (instance_eval) and
        # instance variables are not exposed to this block. See http://stackoverflow.com/questions/5150483/instance-variable-not-available-inside-a-ruby-block
        per_page = @limit
        page = (@offset / @limit) + 1
        search = "#{@search}*"
        logger.debug "------------ retrieving users from Solr"
        # @result = Sunspot.search(User) do
        @result = User.search do
          fulltext search
          paginate :page => page, :per_page => per_page
        end
        #@users = User.where('first_name like :kw or last_name like :kw', :kw=>"%#{@search}%").limit(@limit).offset(@offset).order("#{@order_column} #{@direction}").includes(:groups)
        @users = User.where(id:  @result.results.map(&:id)).order("#{@order_column} #{@direction}").includes(:groups)
        # NOTE: Use the total rows found by search query
        @filteredCount = @result.total
      else
        logger.debug "-------------- retrieving users from database"
        @users = User.where('first_name like :kw or last_name like :kw', :kw=>"%#{@search}%").limit(@limit).offset(@offset).order("#{@order_column} #{@direction}").includes(:groups)
        @filteredCount = @users.count
      end
    end

    respond_with()

  end


  def create
    #user_params = params[:user]
    #@user = User.create(:first_name => user_params['first_name'], :last_name => user_params['last_name'], :username => user_params['username'], :email => user_params['email'], :admin => user_params['admin'])

    @user.create(user_params)
    if @user.errors.any?
      render 'user_errors'
    else
      @group = Group.find(params[:group_id])
      @user.groups << @group
      render 'create'
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    if @user.errors.any?
      render 'user_errors'
    else
      @group = Group.find(params[:group_id])
      @user.groups << @group
      respond_with()
    end
  end

  def edit
    @user = User.where(:id => params[:id]).includes(:groups).first
    @groups = Group.all
    respond_with()
  end

  def new
    @user = User.new()
    @groups = Group.all
    respond_with()
  end

  def show
    @user = User.find(params[:id])
    respond_with()
  end

  def delete
    @user = User.find(params[:id])
    respond_with()
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy unless @user.nil?
    if @user.errors.any?
      # display error messages
    else
      @limit = params[:limit] == nil? ? 10 : params[:limit]
      @offset = params[:offset] == nil? ? 0 : params[:offset]
      @users = User.limit(@limit).offset(@offset).order('created_at DESC')
      respond_with()
    end
  end

  private

  def user_params
    params.require(:user).permit('first_name', 'last_name', 'username', 'email', 'department', 'notes', 'admin', 'image_file_path', 'image_content_type', 'image_file_size', 'authentication_token')
  end

end
