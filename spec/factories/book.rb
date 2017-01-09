FactoryGirl.define do
	factory :book do
		name "Book1"
		publication "publication"
		user_id 1
	end
	factory :invalid_book, parent: :book do
		name nil
	end
end