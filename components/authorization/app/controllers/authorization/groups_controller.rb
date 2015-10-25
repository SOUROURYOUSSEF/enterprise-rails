class Authorization::GroupsController < Authorization::ApplicationController
  respond_to :html, :js, :json

  def index
    # handling Ajax data table filtering, search and sort.
    @limit = params[:length] == nil ? 10 : params[:length]
    @offset = params[:start] == nil ? 0 : params[:start]
    @draw = params[:draw] == nil ? 1 : params[:draw]
    @search = params[:search] == nil ? nil : params[:search][:value]
    @order = params[:order] == nil ? 0 : params[:order]['0'][:column]
    @order_column = params[:columns] == nil ? 'created_at' :params[:columns][@order][:data]
    @total = Group.count
    puts "total = #{@total}"
    if @search == nil || @search == ''
      @groups = Group.limit(@limit).offset(@offset).order("#{@order_column} ASC").includes(:application_scope)
      @filteredCount = Group.count
    else
      @groups = Group.where('first_name like :kw or last_name like :kw', :kw=>"%#{@search}%").limit(@limit).offset(@offset).order("#{@order_column} ASC").includes(:application_scope)
      @filteredCount = @groups.count
    end

    respond_with()
  end

  def create

    @group = Group.create(:name => params['group']['name'], :description => params['group']['description'])
    if @group.errors.any?
      render 'user_errors'
    else
      @scope = ApplicationScope.find(params[:scope_id])
      @group.application_scope = @scope
      render 'create'
    end

  end

  def update
    @group = Group.where(:id => params[:id]).includes(:users, :application_scope).first
    @scope = ApplicationScope.where(:id => params[:scope_id]).first
    @groups = Group.all.includes(:application_scope)
    @group.update!(group_params)
    @group.application_scope = @scope
    @group.save!
    respond_with()
  end

  def edit
    @group = Group.where(:id => params[:id]).includes(:users, :application_scope).first
    @scopes = ApplicationScope.all
    respond_with()
  end

  def new
    @group = Group.new()
    @scopes = ApplicationScope.all
    respond_with()
  end

  def show
    @group = Group.where(:id => params[:id]).includes(:users, :application_scope).first
    @users = @group.users
    @scope = @group.application_scope
    respond_with()
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy unless @group.nil?
    respond_with()
  end

  # Using a private method to encapsulate the permissible parameters
  # is just a good pattern since you'll be able to reuse the same
  # permit list between create and update. Also, you can specialize
  # this method with per-user checking of permissible attributes.
  private

  def group_params
    params.require(:group).permit('name', 'description', 'scope', 'users')

  end
end