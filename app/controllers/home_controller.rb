class HomeController < ApplicationController
	#before_filter :authenticate_user!

	def index
		if user_signed_in?
		@assignments = Assignment.joins(:evaluator => :user).where(:users => {:id => current_user.id}).paginate(:page => params[:page], :per_page => 10)

	    end 
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
