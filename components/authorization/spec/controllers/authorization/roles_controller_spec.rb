require 'rails_helper'

RSpec.describe AuthorizeIt::RolesController, :type => :controller do

  describe 'POST create' do
    before(:each) do
      @attrs = FactoryGirl.attributes_for(:role)
    end
    it 'creates a new role in database' do
      xhr :post, :create, {:role => @attrs}
      expect(Role.count).to be(1)
    end
    it 'returns http success' do
      #attrs = FactoryGirl.attributes_for(:role)
      xhr :post, :create, {:role => @attrs}
      expect(response).to have_http_status(:success)
    end
    # figure out how to test this
    it 'only allowed whitelisted parameters in database' do
      #attrs = FactoryGirl.attributes_for(:role)
      @attrs[:created_at] = Time.now + 1.day
      xhr :post, :create, {:role => @attrs}
      expect(Role.count).to be(1)
    end

  end

   describe 'PUT update' do
     before(:each) do
       @role = FactoryGirl.create(:role)
     end
     it 'saves the changes to database' do
       params = {:id => @role.id, :role => {:name => 'new_name'}}
       xhr :put, :update, params
       expect(Role.find_by(:name => 'new_name')).to_not be_nil
     end
     it 'returns http success' do
       params = {:id => @role.id, :role => {:name => 'new_name'}}
       xhr :put, :update, params
       expect(response).to have_http_status(:success)
     end
   end

   describe 'GET edit' do
     it 'returns http success' do
       @new_role = FactoryGirl.create(:role)
       @role = Role.find(@new_role.id)
       xhr :get, :edit, {:id => @role.id}
       expect(response).to have_http_status(:success)
     end

   end

   describe 'GET new' do
     before(:each) do
       @role = FactoryGirl.create(:role)
     end
     it 'returns http success' do
       xhr :get, :new, {:id => @role.id}
       expect(response).to have_http_status(:success)
     end
   end

   describe 'GET show' do
     before(:each) do
       @role = FactoryGirl.create(:role)
     end
     it 'returns http success' do
       xhr :get, :show,  {:id => @role.id}
       expect(response).to have_http_status(:success)
     end
   end

  #
   describe 'DELETE destroy' do
     before(:each) do
       @role = FactoryGirl.create(:role)
     end
     it 'deletes the role from database' do
       xhr :delete, :destroy, {:id => @role.id}
       expect(Role.count).to be(0)
     end

     it 'returns http success' do
       xhr :delete, :destroy, {:id => @role.id}
       expect(response).to have_http_status(:success)
     end
   end
  #
  describe 'GET index' do
    before(:each) do
      FactoryGirl.create(:role)
      FactoryGirl.create(:role)
      FactoryGirl.create(:role)
    end
    it 'has 3 records in the database' do
      expect(Role.count).to eq(3)
    end
    it 'returns http success' do
      xhr :get, :index
      expect(response).to have_http_status(:success)
    end

  end

end
