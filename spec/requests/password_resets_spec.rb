require 'rails_helper'

RSpec.describe "PasswordResets", :type => :request do
 it "emails user when rquesting password reset" do
   user = FactoryGirl.create(:user)
   user.confirmed_at = Time.now
   user.save
   login_as(user, :scope => :user)
   visit login_path
   click_link "password"
   fill_in "Email", :with => user.email
   click_button "reset password"
 end
end
