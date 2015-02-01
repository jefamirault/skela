class Users::SessionsController < Devise::SessionsController
  before_filter :configure_sign_in_params, only: [:create]
  skip_before_filter :authenticate_user

  # GET /resource/sign_in
  def new
    ## BEGIN Devise implementation
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
    ## END Devise implementation

    # render layout: false
  end

  # POST /resource/sign_in
  def create

    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in)# if is_flashing_format?
    sign_in(resource_name, resource)
    # yield resource if block_given?
    # respond_with resource, location: after_sign_in_path_for(resource)
    # @notice = 'Signed in Successfully!'
    # binding.pry
    respond_to do |format|
      format.js
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # You can put the params you want to permit in the empty array.
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) << :attribute
  end
end
