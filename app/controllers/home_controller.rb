class HomeController < ApplicationController
	#before_filter :authenticate_user!

	def index

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
