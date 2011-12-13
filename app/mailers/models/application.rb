class Application < ActiveRecord::Base
has_many :assignments
#accepts_nested_attributes_for :assignments, :allow_destroy => true

attr_accessible :field_name, :created_at, :updated_at, :field_id, :application_name, :applicant

#TODO named_scope :all "gets all applications in the system, should only be accessible to admin/staff later on"


#TODO (not as important) named_scope :incompletely_assigned "gets all applicatons in the system with less than 3 evaluators"
#TODO (not as important) named_scope :incompletely_evaluated "has less than 3 completed scores for it"

#TODO validations

validates_presence_of :application_name

validates_presence_of :applicant

def to_label 
        "#{application_name} by #{applicant}" 
      end 


end
