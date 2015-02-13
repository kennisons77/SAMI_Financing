class UsersController < ApplicationController
  skip_before_action :set_parent
    respond_to :html


  # GET /users
  # GET /users.json
  def index
    @users = User.all
    respond_with(@users)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_with(@user)
  end

  # GET /users/new
  def new
    @user = Agreement.new
    respond_with(@user)
  end

  # GET /users/1/edit
  def edit
 end

  # POST /users
  # POST /users.json
  def create
    @user = @target.users.new(user_params)
    @user.save
    respond_with(@user)
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end    
    @user.update(user_params)
    respond_with(@user)
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_with(@user)
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :lender_id, :email, :password)
    end
end
