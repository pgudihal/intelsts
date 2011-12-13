class ApplicationController < ActionController::Base

	
  require 'spreadsheet'


  rescue_from CanCan::AccessDenied do |exception|
	 flash[:notice] = "Access denied. You are not authorized to view that page."
	 redirect_to root_url
  end
	  
	def get_all_assignments_for_project(id)
   if current_user.admin? or current_user.staff?
    all_assignments = Assignment.where(:application_id => id).order('assignments.id DESC')   
  else
    all_assignments = get_all_my_assignments(current_user.id)
    all_assignments.where(:application_id => id)
 end
end

  def get_all_assignments_for_project(id)
    if current_user.admin? or current_user.staff?
      all_assignments = Assignment.where(:application_id => id).order('assignments.id DESC')   
    else
      all_assignments = get_all_my_assignments(current_user.id)
      all_assignments.where(:application_id => id)
    end

  end

  def get_all_my_assignments(id)
    if current_user.admin? or current_user.staff?
      all_assignments = Assignment.order('assignments.id DESC')   
    else
    	all_assignments = Assignment.joins(:evaluator => :user).where(:users => {:id => id})
   end
  end

def parse_excel(filename)
  metadata = Spreadsheet.open(filename)
  book1 = metadata.worksheet 0
  book1.each 1 do |row|
    #puts row
    @application = Application.new
    @application.applicant = row[0] + " " + row[1]
    @application.application_name = row[64]
    @application.app_client_id = row[73]
    @application.filename = "Application_"+row[73]
    @application.save!
  end
end

    protect_from_forgery
end
