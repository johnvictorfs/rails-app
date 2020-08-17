class PostsController < ApplicationController
    def index
        # Listar post por ordem decrescente de data de criação
        @posts = Post.all.order("created_at DESC")
    end

    def new
        # Novo post
        @post = Post.new
    end

    def create
        # Criar post
        @post = Post.new(post_params)
  
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end

    def show
        # Pegar post por id
        @post = Post.find(params[:id])
    end

    def update
        # Atualizar post por id
        @post = Post.find(params[:id])
  
        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def destroy
        # Deletar post
        @post = Post.find(params[:id])
        @Post.destroy
  
        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :description)
    end
end
