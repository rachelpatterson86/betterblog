class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def new
  end

  def show
    @user = User.find(params['id'])
    @post = @user.posts
    if @user
      redirect_to user_post_url(@user, @post)
    else
      render :index
    end
  end

  def create
    @user = User.new(user_params)
    @post = nil
    if @user.save
      format.html { redirect_to user_post_url(@user, @post), notice: 'user was successfully created.' }
      format.json { render :show, status: :created, location: user_post_path(@user, @post) }
    else
      format.html { render :new }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
