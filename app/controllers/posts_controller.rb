# frozen_string_literal: true
#
class PostsController < ApplicationController
    before_action :authenticate_user, except: [:index, :show]
    skip_before_action :verify_authenticity_token

    def index
        @post = Post.all
    end

    def new #создание новости
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id]) #поиск нужной статьи
    end

    def edit
        @post = Post.find(params[:id]) #поиск нужной статьи
    end

    def update
        @post = Post.find(params[:id]) #поиск нужной статьи

        if @post.update(post_params) #сохранение в БД

            redirect_to @post

        else
            puts @post.errors.full_messages
            render 'edit'
        end
    end

    def destroy
        # Находим нужный пост
        @post = Post.find(params[:id])
    
        # Удаляем найденный пост
        @post.destroy
        # Выполняем редирект
        redirect_to posts_path
    end

    def create #сохранение новости
        #render plain: params[:post].inspect
        p = post_params
        p[:name] = current_user.name
        @post = Post.new(p) #создание в БД

        
        if @post.save #сохранение в БД
            redirect_to @post
        else
            render 'new'
        end
    end

    def authenticate_user
        unless current_user.present?
            redirect_to new_session_path
        end
    end

    private def post_params
        params.require(:post).permit(:title, :body)
    end
end
