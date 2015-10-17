class Authorization::GroupsController < Authorization::ApplicationController
  respond_to :html, :js, :json

  def index
    @group = Group.all
    respond_with()
  end

  def create
    @group = Group.create!(:name => params['group']['name'], :description => params['group']['description'])
    #@group.scope = params['group']['scope']
    #users = params['group']['users']
    #users.each do |user|
      # find/create and assing users to this group
    #end

    respond_with()

  end

  def update
    @group = Group.where(:id => params[:id]).includes(:users, :application_scope).first
    @users = @group.users
    @scope = @group.application_scope
    @group.update!(group_params)
    respond_with()
  end

  def edit
    @group = Group.where(:id => params[:id]).includes(:users, :application_scope).first
    @users = @group.users
    @scope = @group.application_scope
    respond_with()
  end

  def new
    @group = Group.new()
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