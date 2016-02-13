class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all #"all" method grab all the users
  end
  
  def show
    @user = User.find( params[:id] )
  end
end