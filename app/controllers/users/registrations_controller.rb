class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|   #Overwriting def create located in RegistrarionsController
      if params[:plan]    #parameter call plan
        resource.plan_id = params[:plan] # 1 if basic, 2 if pro plan. 
        if resource.plan_id == 2
          resource.save_with_payment #run save_with_payment method if id=2
        else
          resource.save
        end
      end
    end
  end
end