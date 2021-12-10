class BlogsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_blog, only: [:show, :edit, :update, :destroy]

    def index
        @blogs = Blog.all
    end

    def new
        @blog = Blog.new
    end

    def create
        @blog = Blog.new(blog_params)
        @blog.user_id = current_user.id
        if @blog.save
            redirect_to blogs_path
        else
            render 'new'
        end
    end

    def edit
    end

    def update
    end

    def show
    end

    def destroy
    end

    private

        def blog_params
            params.require(:blog).permit(:title, :description)
        end

        def set_blog
            @blog = Blog.find_by(id: params[:id])
            if @blog.blank?
                render file: 'public/404.html'
            end
        end
end