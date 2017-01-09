require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  describe "notify" do
    let(:mail) { UserMailer.welcome_email User.last }

    it "renders the headers" do
      expect(mail.subject).to eq("welcome_email")
      expect(mail.to).to eq(["ssdd@ss.com"])
      expect(mail.from).to eq(["from@example.com"])
    end

     it "renders the body" do
       expect(mail.body.encoded).to match(User.last.name)
     end
  end
end