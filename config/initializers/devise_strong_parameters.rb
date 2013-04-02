# In Gemfile: gem 'devise', github: 'plataformatec/devise', branch: 'rails4'
#
# In generated model, remove the attr_accessible stuff.
#
# Enable Strong Parameters for Devise instead of attr_accessible. 
# To do so, create a new initiliazer with that content:

DeviseController.class_eval do
  def resource_params
    unless params[resource_name].blank?
      params.require(resource_name).permit(:email, :password, :password_confirmation, :remember_me)
    end
  end
end