class Api::V1::SessionsController < DeviseController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  prepend_before_filter :allow_params_authentication!, :only => :create
  prepend_before_filter { request.env["devise.skip_timeout"] = true }

  prepend_view_path 'app/views/devise'

  # GET /resource/sign_in
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    respond_with(resource, serialize_options(resource))
  end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)

    respond_to do |format|
      format.json { render :json => "Signed in!".to_json, :status => :ok }
      format.html { respond_with resource, :location => after_sign_in_path_for(resource) } 
    end
  end

  # DELETE /resource/sign_out
  def destroy
    redirect_path = after_sign_out_path_for(resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :notice, :signed_out if signed_out && is_navigational_format?

    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.all { render :json => "Signed out!".to_json, :status => :ok }
      format.any(*navigational_formats) { redirect_to redirect_path }
    end
  end


  protected

  def sign_in_params
    devise_parameter_sanitizer.sanitize(:sign_in)
  end

  def serialize_options(resource)
    methods = resource_class.authentication_keys.dup
    methods = methods.keys if methods.is_a?(Hash)
    methods << :password if resource.respond_to?(:password)
    { :methods => methods, :only => [:password] }
  end

  def auth_options
    { :scope => resource_name, :recall => "#{controller_path}#new" }
  end
end



# class Api::V1::SessionsController < ApplicationController
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
