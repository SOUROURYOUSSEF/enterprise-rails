class Authorization::RolesController < Authorization::ApplicationController

  respond_to :html, :js, :json

  def index
    @roles = Role.all
    respond_with()
  end

  def create
    Role.create!(:name => params['role']['name'], :description => params['role']['description'])
    respond_with()

  end

  def update
    role = Role.find(params[:id])
    role.update!(role_params)
    respond_with()
  end

  def edit
    @role = Role.find(params[:id])
    respond_with()
  end

  def new
    @role = Role.new()
    respond_with()
  end

  def show
    @role = Role.find(params[:id])
    respond_with()
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy unless @role.nil?
    respond_with()
  end

  # Using a private method to encapsulate the permissible parameters
  # is just a good pattern since you'll be able to reuse the same
  # permit list between create and update. Also, you can specialize
  # this method with per-user checking of permissible attributes.
  private

  def role_params
    params.require(:role).permit('name', 'description')

  end

end
