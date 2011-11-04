class ApplicationController < ActionController::Base
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
  protect_from_forgery
end
