class List < ActiveRecord::Base
	belongs_to :user
	has_many :items
    #after_initialize  -> force the permission to confine within the set and default if nil
	#validates :name, presence: true  
    validates :permissions, inclusion: { in: %w(private viewable open), message: "%{permissions} is not a valid option." }
end
