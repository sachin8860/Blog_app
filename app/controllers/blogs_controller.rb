class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  # GET /blogs or /blogs.json
  def index
    @categories = Category.all
    @blogs = Blog.all
    @tags = Tag.all
  end

  # GET /blogs/1 or /blogs/1.json
  def show
  end

  def show_category
    @categories = Category.all
    @category = Category.where(id: params[:category_id]).first
    @blogs = @category.blogs
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    @blog.blog_tags.build
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully created." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        @tag_len = params[:blog][:tags_attributes]
        @tag_len.each do |key, value|
          @tag = Tag.find(value[:id])
          @tag.update(name: value[:_destroy])
        end
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :body, :category_id, :image, tags_attributes: [:id, :name, :_destroy], blog_tags_attributes: [:id, :tag_id, :blog_id, :_destroy])
    end

    def tag_params
      params.require(:tag).permit(:title, :body, :category_id, :image, tags_attributes: [:id, :name, :_destroy], blog_tags_attributes: [:id, :tag_id, :blog_id, :_destroy])
    end
end
