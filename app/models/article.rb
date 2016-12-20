class Article < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :comments,dependent: :destroy
	
	 accepts_nested_attributes_for :comments,
    :allow_destroy => true,
    :reject_if     => :all_blank
	
	def self.find_recent
		Article.last(10)
	end

end
