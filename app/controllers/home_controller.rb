class HomeController < ApplicationController
	#before_filter :authenticate_user!

	def index
		@assignments = get_all_my_assignments(current_user.id) 
		render :action => params[:home], :layout => "application"
	end

	def show
		render :action => params[:page_type]
	end

	def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


end
