class UsersController < ApplicationController
  
  before_action :logged_in_user, only: [:edit, :update]
  #before_action :user_params, only: [:edit, :update]
  before_action :user_params, only: [:update]
  
  def show
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    #ログイン中useridとparamのuseridを比較
    if (@current_user.id != (params[:id]).to_i)
      redirect_to  root_path
    else
      #一致する場合はeditをeditにparamで引けるuser情報を表示
      #@user= User.find(params[:id])
      @user= User.find(current_user.id)
    end
  end
  
  def update
    if @current_user.update(user_params)
      flash[:success] = 'Your profile Updated'
      @user= User.find(current_user.id)
      render 'show'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :area, :password, :password_confirmation)
  end
  
end
