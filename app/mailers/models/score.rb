class Score < ActiveRecord::Base
has_one :assignment
belongs_to :application
belongs_to :evaluator

attr_accessible :research_score, :scientific_potential, :entry_score, :updated_at
#TODO validates that the scores fit the limitations of the scoring system

#TODO named_scope :for_user "returns a list of scores that the evaluator was assigned to fill out"
end
