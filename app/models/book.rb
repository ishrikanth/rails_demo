class Book < ApplicationRecord
  belongs_to :user,counter_cache:true
  validates :name, presence: {message: "Name is blank"}
  # validates :name, length: {minimum: 2,message: "less"}
  # validates :name, length: {maximum: 3,message: "more"}
  # validates :name, length: {in: 3..5}
  # validates :name, length: {is: 3}
  # validates :publication, presence: true, if: :check_exist
  # validates :name, inclusion: {in: ["book1","book2"]}
  # validate :custom_method
  # validates :name, uniqueness:{case_sensitive: true}

 # before_validation :assign_dummy_value_to_name

 # after_validation :update_name

 def update_name
 	self.name=self.name.downcase
 end

 def assign_dummy_value_to_name
 	self.name="Test1"
 end
  def check_exist
  	!name.nil?
  end

  def custom_method
  	if publication!="xyz"
  		errors.add(:publication, "Not a Valid")
  	end
  end
end
