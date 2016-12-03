class Blog < ApplicationRecord
	has_many :users, through: :blog_users
	has_many :blog_users
end
