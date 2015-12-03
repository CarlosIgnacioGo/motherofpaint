class PostsController < ApplicationController
  def index
		
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(set_params)

    if @post.save
    	flash[:notice] = "El post se a creado correctamente"
    	redirect_to @post
    else
    	flash[:alert] = "No se pudo crear el post"
    	render "new"
    end
  end

  private

  def set_params
  	params.require(:post).permit(:link_youtube, :link_img, :description)
  end
end
