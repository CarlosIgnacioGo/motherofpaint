class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
  	@posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
    	flash[:info] = "El post se a creado correctamente"
    	redirect_to @post
    else
    	flash[:danger] = "No se pudo crear el post"
    	render "new"
    end
  end

  def show
  end

  def edit
  end

  def update

    if @post.update(post_params)
      flash[:info] = "El post se a actualizado"
      redirect_to @post
    else
      flash[:danger] = "No se pudo actualizar el post"
      render "edit"
    end
  end

  def destroy
    if @post.destroy
      flash[:info] = "Post eliminado"
      redirect_to posts_path
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
  	params.require(:post).permit(:link_youtube, :link_img, :description)
  end
end
