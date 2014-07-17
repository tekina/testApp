require 'spec_helper'

# include Devise::TestHelpers                          
include Warden::Test::Helpers                        
Warden.test_mode!                                    

RSpec.describe BlogsController, type: :controller do

  before(:each) do
        request.env["HTTP_REFERER"] = '/blogs'
    sign_out(:user)
  end

  def login_user
    @user = FactoryGirl.create(:user)  
    sign_in @user
  end

	it "should have a current_user" do
		login_user
    subject.current_user.should_not be_nil
  end

	describe "GET index" do
    it "has a 200 status code" do
      login_user
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do
    it "assigns the requested blog as @blog" do
      login_user
      @blog = FactoryGirl.create(:blog)
      get :show, {id: @blog.id}
      expect(assigns(:blog)).to eq(@blog)
    end
  end

  describe "GET new" do
  	it "has a 200 status code" do
      login_user
      get :new
      expect(assigns(:blog)).to be_a_new(Blog)
    end
  end

  describe "GET edit" do
    it "assigns the requested blog as @blog" do
      login_user
      @blog = FactoryGirl.create(:blog)
      get :edit, {id: @blog.id}
      expect(assigns(:blog)).to eq(@blog)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Blog" do
        login_user
        @blog = FactoryGirl.create(:blog)
        expect {post :create, {blog: @blog.attributes}}.to change(Blog, :count).by(1)
      end

      it "assigns a newly created blog as @blog" do
        login_user
        @blog = FactoryGirl.create(:blog)
        post :create, {blog: @blog.attributes}
        expect(@blog).to be_a(Blog)
        expect(@blog).to be_persisted
      end

       it "redirects to the created blog" do
        login_user
        @blog = FactoryGirl.create(:blog)
        request.env["HTTP_REFERER"] = '/blogs/' + @blog.id.to_s
        post :create, {blog: @blog.attributes}
        expect(response).to redirect_to(Blog.last)#'/blog/' + @comment.id.to_s)
      end

    describe "with invalid params" do
      it "assigns a newly created but unsaved blog as @blog" do
        login_user
        @blog = FactoryGirl.create(:blog)
        @blog.post = nil
        post :create, {blog: @blog.attributes}
        expect(@blog).to be_a(Blog)
      end
    end

  		it "redirects to blog index page" do
  			login_user
      	post :create, blog: FactoryGirl.attributes_for(:blog)
    		expect(response.status).to eq(302) #redirect_to blog/:id
      end
    end
  end


  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested blog" do
        login_user
        @blog = FactoryGirl.create(:blog)
        put :update, {id: @blog.id, blog: @blog.attributes}
        @blog.reload
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested blog" do
        login_user
        @blog = FactoryGirl.create(:blog)
        put :update, {id: @blog.id, blog: @blog.attributes}
        @blog.reload
      end

      it "assigns the requested blog as @blog" do
        login_user
        @blog = FactoryGirl.create(:blog)
        put :update, {id: @blog.id, blog: @blog.attributes}
        expect(assigns(:blog)).to eq(@blog)
      end

      it "redirects to the blog" do
        login_user
        @blog = FactoryGirl.create(:blog)
        put :update, {id: @blog.id, blog: @blog.attributes}
        expect(response).to redirect_to(Blog.last)
      end
    end

    describe "with invalid params" do
      it "assigns the blog as @blog" do
        login_user
        @blog = FactoryGirl.create(:blog)
        @blog.post = nil
        put :update, {id: @blog.id, blog: @blog.attributes}
        expect(assigns(:blog)).to eq(@blog)
      end

      it "re-renders the 'edit' template" do
        login_user
        @blog = FactoryGirl.create(:blog)
        @blog.post = nil
        put :update, {id: @blog.id, blog: @blog.attributes}
        expect(response).to render_template("blogs/edit")
      end    
    end
  end

 describe "DELETE destroy" do
    it "destroys the requested blog" do
      login_user
      @blog = FactoryGirl.create(:blog)
      expect {
        delete :destroy, {id: @blog.id}
      }.to change(Blog, :count).by(-1)
    end

    it "redirects to the blogs list" do
      login_user
      @blog = FactoryGirl.create(:blog)
      delete :destroy, {id: @blog.id}
      expect(response).to redirect_to(blogs_url)
    end
  end
end
