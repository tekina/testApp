class ApiController < ApplicationController
  # before_action :authenticate_user!
  skip_before_filter  :verify_authenticity_token
  # before_action :set_blog, only: [:show]
  # GET /api
  # GET /api.json
  def index
      @blogs = Blog.all
      render json: @blogs
  end

  # GET /api/1
  # GET /api/1.json
  def show
    @blog = Blog.find(params[:id])
    render json: @blog
  end

  # GET /api/new
  def new
    @blog = Blog.new
  end

  # GET /api/1/edit
  def edit
    @blog = Blog.find(params[:id])
    render json: @blog
  end

  # POST /api
  # POST /api.json
  def create
    # redirect_to action: 'index' and return  
    # if user_signed_in? 
      @blog = Blog.new(blog_params.merge(user_id: current_user.try(:id)))
      respond_to do |format|
        if @blog.save
          # format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
          format.json { render json: @blog, status: :created, location: @blog }
        else
          # format.html { render action: 'new' }
          format.json { render json: @blog.errors, status: :unprocessable_entity }
        end
      end
    # else
    #   respond_to do |format|
    #     format.json { render json: 'Unable to create blog post. Are you logged in?'.to_json, status: :unprocessable_entity}
    #   end
    # end
  end

  # PATCH/PUT /api/1
  # PATCH/PUT /api/1.json
  def update
    # redirect_to action: 'index' and return  if !user_signed_in? 
    if user_signed_in?
      @blog = Blog.find(params[:id])
      respond_to do |format|
        if @blog.update(blog_params)
          # format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
          format.json {render json: @blog, status: :created, location: @blog } # head :no_content
        else
          # format.html { render action: 'edit' }
          format.json { render json: @blog.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.json { render json: 'Unable to edit blog post. Are you logged in?'.to_json, status: :unauthorized}
      end
    end
  end

  # DELETE /api/1
  # DELETE /api/1.json
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
      params.require(:blog).permit(:post, :summary)
    end
end
