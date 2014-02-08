class PostsController < ApplicationController
  before_action :load_shared
  before_action :load_post, only: :create
  before_action :load_archive, only: :archive
  load_and_authorize_resource
  #before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = @posts.recent.page(params[:page]).per(5)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    #@post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    #@post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  # GET /posts/archive/2014/02
  # GET /posts/archive/2014/02.json
  def archive
    @date = Date.parse("#{params[:year]}-#{params[:month]}-01").strftime('%B, %Y')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end

    def load_shared
      posts = Post.recent
      @posts_by_year = posts.group_by { |post| post.created_at.beginning_of_year }
      @posts_by_month = posts.group_by { |post| post.created_at.beginning_of_month }
    end

    def load_post
      @post = current_user.posts.build(post_params)
    end

    def load_archive
      @posts = Post.from_archive(params[:year], params[:month])
    end
end
