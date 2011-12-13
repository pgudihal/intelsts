class Assignment < ActiveRecord::Base
has_one :application
belongs_to :evaluator


attr_accessible :application_id, :evaluator_id, :research_score, :entry_score, :scientific_potential
validates_uniqueness_of :evaluator_id, :scope => :application_id

end
