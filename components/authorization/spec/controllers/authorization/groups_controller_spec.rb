require 'rails_helper'

RSpec.describe AuthorizeIt::GroupsController, :type => :controller do

  describe 'POST create' do
    before(:each) do
      @attrs = FactoryGirl.attributes_for(:group)
    end
    it 'creates a new group in database' do
      xhr :post, :create, {:group => @attrs}
      expect(Group.count).to be(1)
    end
    it 'returns http success' do
      xhr :post, :create, {:group => @attrs}
      expect(response).to have_http_status(:success)
    end
    # figure out how to test this
    it 'only allowed whitelisted parameters in database' do
      @attrs[:bogus] = Time.now + 1.day
      xhr :post, :create, {:group => @attrs}
      expect(Group.count).to be(0)
    end
  end


  describe 'PUT update' do
    before(:each) do
      @group = FactoryGirl.create(:group)
    end
    it 'saves the changes to database' do
      params = {:id => @group.id, :group => {:name => 'new_name'}}
      xhr :put, :update, params
      expect(Group.find_by(:name => 'new_name')).to_not be_nil
    end
    it 'returns http success' do
      params = {:id => @group.id, :group => {:name => 'new_name'}}
      xhr :put, :update, params
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET edit' do
    it 'returns http success' do
      @new_group = FactoryGirl.create(:group)
      @group = Group.find(@new_group.id)
      xhr :get, :edit, {:id => @group.id}
      expect(response).to have_http_status(:success)
    end

  end


  describe 'GET new' do
    before(:each) do
      @group = FactoryGirl.create(:group)
    end
    it 'returns http success' do
      xhr :get, :new, {:id => @group.id}
      expect(response).to have_http_status(:success)
    end
  end


  describe 'GET show' do
    before(:each) do
      @group = FactoryGirl.create(:group)
    end
    it 'returns http success' do
      xhr :get, :show,  {:id => @group.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE destroy' do
    before(:each) do
      @group = FactoryGirl.create(:group)
    end
    it 'deletes the group from database' do
      xhr :delete, :destroy, {:id => @group.id}
      expect(Group.count).to be(0)
    end

    it 'returns http success' do
      xhr :delete, :destroy, {:id => @group.id}
      expect(response).to have_http_status(:success)
    end
  end



  describe 'GET index' do
    before(:each) do
      FactoryGirl.create(:group)
      FactoryGirl.create(:group)
      FactoryGirl.create(:group)
    end
    it 'has 3 records in the database' do
      expect(Group.count).to eq(3)
    end
    it 'returns http success' do
      xhr :get, :index
      expect(response).to have_http_status(:success)
    end

  end

end
