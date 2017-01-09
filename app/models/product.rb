class Product < ApplicationRecord

	  validates :name, presence: {message: "Name is blank"}

end
