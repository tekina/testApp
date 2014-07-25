require 'rails_helper'

RSpec.describe Api::V1::BlogsController, :type => :controller do

	describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

   describe "GET show" do
    it "assigns the requested blog as @blog" do
      @blog = FactoryGirl.create(:blog)
      get :show, {id: @blog.id}
      expect(assigns(:blog)).to eq(@blog)
    end
  end

  # describe "POST create" do
  #   describe "with valid params" do
  #     it "creates a new Blog" do
  #       @blog = FactoryGirl.create(:blog)
  #       post :create, {blog: @blog.attributes}
  #       expect(response.status).to eq(:created)
  #     end
  #  	end

  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved blog as @blog" do
  #       @blog = FactoryGirl.create(:blog)
  #       @blog.post = nil
  #       post :create, {blog: @blog.to_json}
  #       expect(response.status).to eq(:unprocessable_entity)
  #     end
  #   end
  # end

  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested blog" do
  #       @blog = FactoryGirl.create(:blog)
  #       put :update, {id: @blog.id, blog: @blog.attributes}
  #       expect(response.status).to eq(200)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "does not update the blog" do
  #       @blog = FactoryGirl.create(:blog)
  #       @blog.post = nil
  #       put :update, {id: @blog.id, blog: @blog.attributes}
  #       expect(response.status).to not_eq(200)
  #     end
  #   end
  # end

end
