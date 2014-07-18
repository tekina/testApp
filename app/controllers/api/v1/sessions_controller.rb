class Api::V1::SessionsController < DeviseController
  prepend_before_filter :require_no_authentication, :only => [:create ]
  # https://github.com/plataformatec/devise/blob/master/app/controllers/devise/sessions_controller.rb

  before_filter :ensure_params_exist
 
  respond_to :json

  # POST /resource/sign_in
  # Resets the authentication token each time! Won't allow you to login on two devices
  # at the same time (so does logout).

  def create
    build_resource
    resource = User.find_for_database_authentication(:login=>params[:user_login][:login])
    return invalid_login_attempt unless resource
 
    if resource.valid_password?(params[:user_login][:password])
      sign_in("user", resource)
      render :json=> {:success=>true, :auth_token=>resource.authentication_token, :login=>resource.login, :email=>resource.email}
      return
    end
    invalid_login_attempt
  end

  # def create
  #   self.resource = warden.authenticate!#(auth_options)
  #   sign_in(resource_name, resource)
 
  #   current_user.update authentication_token: nil
 
  #   respond_to do |format|
  #     render :json => {info: "Logged in", user: :current_user, auth_token: current_user.authentication_token}, status: 200
  #   end
  # end

  # DELETE /resource/sign_out
  def destroy
    respond_to do |format|
      format.json {
        if current_user
          current_user.update authentication_token: nil
          signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
          render :json => { :info => "Logged out" }, :status => 200
        else
          render :json => {}.to_json, :status => :unprocessable_entity
        end
      }
    end
  end
end


 private
  def ensure_params_exist
    return unless params[:user_login].blank?
    render :json=>{:success=>false, :message=>"missing user_login parameter"}, :status=>422
  end
 
  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end


#    # acts_as_token_authentication_handler_for User

#   prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
#   prepend_before_filter :allow_params_authentication!, :only => :create
#   prepend_before_filter { request.env["devise.skip_timeout"] = true }

#   prepend_view_path 'app/views/devise'

#   # GET /resource/sign_in
#   def new
#     self.resource = resource_class.new(sign_in_params)
#     clean_up_passwords(resource)
#     respond_with(resource, serialize_options(resource))
#   end

#   # POST /resource/sign_in
#   def create
#     self.resource = warden.authenticate!(auth_options)
#     # set_flash_message(:notice, :signed_in) if is_navigational_format?
#     sign_in(resource_name, resource)

#     respond_to do |format|
#       format.json { render :json => User.find(current_user.id).authentication_token.to_json, :status => :ok }
#       # format.html { respond_with resource, :location => after_sign_in_path_for(resource) } 
#     end
#   end

#   # DELETE /resource/sign_out
#   def destroy
#     redirect_path = after_sign_out_path_for(resource_name)
#     signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
#     set_flash_message :notice, :signed_out if signed_out && is_navigational_format?

#     # We actually need to hardcode this as Rails default responder doesn't
#     # support returning empty response on GET request
#     respond_to do |format|
#       format.all { render :json => "Signed out!".to_json, :status => :ok }
#       format.any(*navigational_formats) { redirect_to redirect_path }
#     end
#   end


#   protected

#   def sign_in_params
#     devise_parameter_sanitizer.sanitize(:sign_in)
#   end

#   def serialize_options(resource)
#     methods = resource_class.authentication_keys.dup
#     methods = methods.keys if methods.is_a?(Hash)
#     methods << :password if resource.respond_to?(:password)
#     { :methods => methods, :only => [:password] }
#   end

#   def auth_options
#     { :scope => resource_name, :recall => "#{controller_path}#new" }
#   end
# end



# # class Api::V1::SessionsController < ApplicationController
# # 	respond_to :json
# #   skip_before_filter :verify_authenticity_token

# #   def create
# # 	 # @user = User.find_by(email: params[:session][:email])
# #    #  if @user && @user.authenticate(params[:session][:password])
# #    #    token = User.new_remember_token
# #    #    @user.update_attribute(:remember_token, User.digest(token))
# #    #    respond_with :api, :v1
# #    #  else
# #    #  	render :json => { :error => 'Oops! Bad request' }, :status => 400 
# #    #  end
		
# # 		warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
# #     sign_in(resource_name, resource)
# # 	  render :json => {:success => true}
# #   end

# #   def destroy
# #   	Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
# #     render :json => {:success => false, :errors => ["Login Failed"]}, status: :unauthorized
# #   end
# # end
