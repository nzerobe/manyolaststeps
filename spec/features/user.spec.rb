
 # In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Blog management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check.
  background do

  User.create!(name: "admin", email: 'adminn@gmail.com',  password: 'admin0011')
  visit  root_path
 
  fill_in  'Email' ,  with: 'admin@gmail.com'
  fill_in  'Password' ,  with: 'admin0011'

  visit blogs_path

end
  
  
  scenario "Test user registration" do
    visit new_user_path
    fill_in "Name",with: "admin"
    fill_in "Email",with: "adminnn@gmail.com"
    fill_in "Password",with: "admin0011"
    
    click_on 'Create User'
    expect(page).to have_content "user"
  end
  
   scenario "Test login function" do
    visit new_session_path
    fill_in 'Email',with: "adminnn@gmail.com"
    fill_in "Password",with: "admin0011"
    click_button 'Log in'
    expect(page).to have_content " "
  end
  
  scenario "Logout function" do
    visit new_session_path
    fill_in 'Email',with: "adminnn@gmail.com"
    fill_in "Password",with: "admin0011"
    click_button 'Logout'
#     click_on 'Log Out'
    expect(page).to have_content "Logged out"
  end
  

  
  
  
  
end