class Course < ApplicationRecord
	has_many :teaching_staffs, as: :ta_staff
end
