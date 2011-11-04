class RegistrationsController < Devise::RegistrationsController
	protected

  def after_sign_up_path_for(resource)

  if !current_user.admin? and !current_user.staff?
    '/evaluators/new'
  end
end
end
