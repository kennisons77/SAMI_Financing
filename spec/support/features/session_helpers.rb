# spec/support/features/session_helpers.rb
module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Sign up'
    end

    # def sign_in_with(email, password)
      # user = FactoryGirl.create(:user)
      # user.confirmed_at = Time.now
      # user.save
      # visit new_user_session_path
      # fill_in 'Email', with: email || user.email
      # fill_in 'Password', with: password || user.password
      # click_button 'Sign in'
    # end
#     
  end
end