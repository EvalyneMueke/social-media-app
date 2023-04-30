# app/controllers/users_controller.rb

class UsersController < ApplicationController
  before_action :authorize
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @posts = @user.posts.order(created_at: :desc)
    render json: @posts
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)

      render json: @user
      # redirect_to @user, notice: 'User was successfully updated.'
    else
      render json: {errors: errors.user.full_messages}
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :profile_picture, :bio)
  end
end
