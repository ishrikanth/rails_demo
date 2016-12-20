class User < ApplicationRecord
	validates :name, presence: true
	has_many :books,dependent: :destroy
	has_one :user_profile
	has_and_belongs_to_many :articles
	has_many :blogs, through: :blog_users
	has_many :blog_users
	has_many :recent_books, ->{order("created_at desc").limit(1)},class_name: "Book"
	#around_save :execute_valid_check
	scope :active_users, -> {where("is_active= true and is_active=false")}
	scope :custom_active_users, ->{active_users.where(name: "Test")}

	scope :parametered_scope, ->(name) {active_users.where(name: name)}
	scope :conditional_parametered_scope, ->(name) {active_users.where(name: name) if !name.nil?}

	default_scope  {where(is_active: true)}

	enum gender: [:male,:female]

	def execute_valid_check
		p "Executing some Transaction"
	end

	#delegate :fi, 

	def first_name
		user_profile.first_name
	end

	delegate :test, to: :books
end
