class UsersController < ApplicationController
  
  respond_to :json, :html
  
  def index
    @users = User.all
    respond_with @users
  end

  def show
    set_user
    respond_with @users
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save 
        respond_to do |format|
          format.html { redirect_to users_path }
          format.json { render json: @user, status: :created }
        end
      else
        respond_to do |format|
          format.html { render 'new'}
          format.json { render json: @user.errors, status: :unprocessable_entity}
        end
      end
  end

  def edit
  end

  def update
    @user = User.update(user_params)
      if @user.save 
        respond_to do |format|
          format.html { redirect_to users_path }
          format.json { render nothing: true, status: :no_content }
        end
      else
        respond_to do |format|
        format.html { render 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy
    @user = User.destory

    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { render json: { head: :ok } }
    end  

  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
