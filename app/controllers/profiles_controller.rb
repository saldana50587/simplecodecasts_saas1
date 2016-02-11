class ProfilesController < ApplicationController
 
  before_action :authenticate_user!
  before_action :only_current_user
 
  def new
    # form where a user can fill out their own profile.
    @user = User.find( params[:user_id] )
    @profile = Profile.new #each user should have his own profile
  end
  
  def create  
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile(profile_params) #Pass all values from the form fields
    
    if @profile.save
      flash[:success] = "Profile Updated!"
      redirect_to user_path( params[:user_id] ) #If save works lets redirect user to another page (show_page)
    else
      render action: :new #If it fails, load the "new" method from above. 
    end
  end
  
    def edit
  @user = User.find( params[:user_id] )
  @profile = @user.profile
    end
    
    def update
  @user = User.find( params[:user_id] )
  @profile = @user.profile
  
  if @profile.update_attributes(profile_params)
    flash[:success] = "Profile Updated!"
    redirect_to user_path( params[:user_id] )
  else
    render action: :edit
  end
end
  
  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
    end
    
    def only_current_user
      @user = User.find( params[:user_id] )
      redirect_to(root_url) unless @user == current_user
    end
    
  # Warning: Anything below this line will become private as well. 
    
    
end
  



