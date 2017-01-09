require 'rails_helper'

RSpec.describe BooksController, type: :controller do
	desc "GET #index" do
		it "response 200 status code" do
			get :index
			 expect(response.response_code).to_eq 200
			end
		end
end
