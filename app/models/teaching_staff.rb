class TeachingStaff < ApplicationRecord
	belongs_to :ta_staff,polymorphic: true
end
