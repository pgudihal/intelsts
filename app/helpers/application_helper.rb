module ApplicationHelper

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

def get_all_assignments_for_evaluator(id)
  #if current_user.admin? or current_user.staff?
    all_assignments = Assignment.where(:evaluator_id => id)
     
 #end
end




#def get_all_applications(id)

  #if current_user.admin? or current_user.staff?
  #	all_applications = Applications.all
  #else
  #	all_assignments = get_all_my_assignments(id)
  #	apps = Applications.where(:applicant => current_user.name,)
  #	all_applications = app.

#end


#TODO get_all_unconfirmed_evaluators

	#TODO get_all_evaluators_in_category(id)

	#TODO get_all_my_scores(id)

	#TODO get_all_applications_in_category(id)

end