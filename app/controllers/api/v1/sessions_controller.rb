# class Api::V1::SessionsController < DeviseController
#   # https://github.com/plataformatec/devise/blob/master/app/controllers/devise/sessions_controller.rb

#   # POST /resource/sign_in
#   # Resets the authentication token each time! Won't allow you to login on two devices
#   # at the same time (so does logout).

#   skip_before_filter  :verify_authenticity_token

#   def create
#     self.resource = warden.authenticate!#(auth_options)
#     sign_in(resource_name, resource)
 
#     current_user.update authentication_token: nil
 
#     respond_to do |format|
#       format.json {
#         # render :json => (current_user.authentication_token).to_json, status: :ok }
#         render :json=> {:success=>true, :auth_token=>resource.authentication_token, :login=>resource.login, :email=>resource.email}
#         return
#           # :user => current_user,
#           # :authentication_token => 
#     end
#   end

#   # DELETE /resource/sign_out
#   def destroy
#     respond_to do |format|
#       format.json {
#         if current_user
#           current_user.update authentication_token: nil
#           signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
#           render :json => "Signed out successfully!".to_json, status: :ok
#         else
#           render :json => {}.to_json, :status => :unprocessable_entity
#         end
#       }
#     end
#   end
# end



class Api::V1::SessionsController < Devise::SessionsController #ApplicationController
# 	respond_to :json
#   skip_before_filter :verify_authenticity_token

#   def create
# 	 # @user = User.find_by(email: params[:session][:email])
#    #  if @user && @user.authenticate(params[:session][:password])
#    #    token = User.new_remember_token
#    #    @user.update_attribute(:remember_token, User.digest(token))
#    #    respond_with :api, :v1
#    #  else
#    #  	render :json => { :error => 'Oops! Bad request' }, :status => 400 
#    #  end
		
# 		warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
#     sign_in(resource_name, resource)
# 	  render :json => {:success => true}
#   end

#   def destroy
#   	Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
#     render :json => {:success => false, :errors => ["Login Failed"]}, status: :unauthorized
#   end
# end

# class SessionsController < Devise::SessionsController
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    sign_in_and_redirect(resource_name, resource)
  end
 
  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    return render :json => {:success => true}
  end
 
  def failure
    return render :json => {:success => false, :errors => ["Login failed."]}
  end
end