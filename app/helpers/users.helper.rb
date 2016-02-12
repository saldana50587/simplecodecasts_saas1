module UsersHelper
    
    def job_title_icon
       if @user.profile.job_title == "Developer"
         "<i class='fa fa-code'></i>".html_safe
       end
    end
end
    

