class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  PER = 6


    def new
      @user = User.new
    end
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = 'User was successfully created'
        redirect_to user_path(@user.id)
      else
        render :new
      end
    end
    def show
      @user = current_user
      redirect_to tasks_path if @user.id !=  params[:id].to_i
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'Profile successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :photo, :photo_cache)
    end
    def set_user
      @user = User.find(params[:id])
    end
end