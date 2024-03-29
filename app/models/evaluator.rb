class Evaluator < ActiveRecord::Base

has_many :assignments, :dependent => :destroy
has_many :applications, :through => :assignments
belongs_to :user


attr_accessible :field_name, :address, :city, :state, :zip_code, :user_id

validates :agreement, :acceptance => true
validates_associated :user
validates :user_id, :uniqueness => true
validates_presence_of :field_name, :address, :city, :state, :zip_code

def to_label 
        "#{User.find(user_id).first_name} #{User.find(user_id).last_name}" 
      end 
end
