class Api::V1::BlogsController < ApplicationController
  # before_action :authenticate_user!
  skip_before_filter  :verify_authenticity_token
  # before_action :set_blog, only: [:show]
  # GET /blog
  # GET /blog.json
  def index
      @blogs = Blog.all
      render json: @blogs
  end

  # GET /blog/1
  # GET /blog/1.json
  def show
    @blog = Blog.find(params[:id])
    render json: @blog
  end

  # GET /blog/1/edit
  def edit
    @blog = Blog.find(params[:id])
    render json: @blog
  end

  # POST /blog
  # POST /blog.json
  def create
      @blog = Blog.new(blog_params.merge(user_id: current_user.try(:id)))
      respond_to do |format|
        if @blog.save
          format.json { render json: @blog, status: :created, location: @blog }
        else
          format.json { render json: @blog.errors, status: :unprocessable_entity }
        end
      end
    # else
    #   respond_to do |format|
    #     format.json { render json: 'Unable to create blog post. Are you logged in?'.to_json, status: :unprocessable_entity}
    #   end
    # end
  end

  # PATCH/PUT /blog/1
  # PATCH/PUT /blog/1.json
  def update
    # redirect_to action: 'index' and return  if !user_signed_in? 
    if user_signed_in?
      @blog = Blog.find(params[:id])
      respond_to do |format|
        if @blog.update(blog_params)
          format.json {render json: @blog, status: :created, location: @blog } # head :no_content
        else
          format.json { render json: @blog.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.json { render json: 'Unable to edit blog post. Are you logged in?'.to_json, status: :unauthorized}
      end
    end
  end

  # DELETE /blog/1
  # DELETE /blog/1.json
  def destroy
    if user_signed_in?
      @blog = Blog.find(params[:id])
      @blog.destroy
      respond_to do |format|
        format.json { render json: "Deleted blog post!".to_json } #head :no_content }
      end
    else
      respond_to do |format|
        format.json { render json: 'You have to log in before deleting a post'.to_json, status: :unauthorized}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:post, :summary, :user_id)
    end
end
