# require 'rails_helper'
# 
 # feature "forgotten password" do
   # scenario"emails user when rquesting password reset" do
     # user = FactoryGirl.create(:user)
     # user.confirmed_at = Time.now
     # user.save
     # visit new_user_session_path    
     # click_link "password"
     # fill_in "Email", :with => user.email
     # click_button "reset password"
     # page.should have_content("email with instructions")
     # last_email.to.should include(user.email)   
   # end
 # end
