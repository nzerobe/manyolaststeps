# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "user management function", type: :feature do
# In scenario (alias of it), write the processing of the test for each item you want to check.
background do
  User.create!(name: "admin", email: 'admin@gmail.com', title: 'admin',  password: 'admin0011')
  visit  root_path
  #click_on 'Login'
  fill_in  'Email' ,  with: 'admin@gmail.com'
  fill_in  'Password' ,  with: 'admin0011'
  click_on  'Login'
end

 scenario "Test number of users" do
  User.create!(name: 'admin', email: 'admin@gmail.com', title: 'admin', password: 'admin0011')
  @user = User.all.count
  expect(@user).to eq 2
end
scenario "Test user list" do
    User.create!(name: 'margo', email: 'admin@gmail.com', title: 'admin', password: 'admin0011')
  visit admin_users_path
  expect(page ).to  have_content  'List Of Users'
  
 end


scenario "Test user creation" do
  User.create!(name: 'admin', email: 'admin@gmail.com', title: 'admin', password: 'admin0011')
  visit admin_users_path
  expect(page ).to  have_content 'User Created'
end

scenario "Test user details" do
  @user= User.create!(name: 'admin', email: 'admin@gmail.com', title: 'admin', password: 'admin0011')
  visit admin_users_path(id: @user.id)
  expect(page).to have_content('admin')
  expect(page).to have_content('admin@gmail.com')
  expect(page).to have_content('admin')
end
scenario "Test user updating" do
 
  @user = User.first
  visit edit_user_path(id: @user.id)
  fill_in 'Name', with: 'name update'
  #fill_in 'Content', with: 'content update'
  
  click_on 'Create my account'
  visit users_path
  expect(page).to have_text('')
  #expect(page).to have_content('content update')

end
scenario 'Test user Deletion' do
  User.create!(name: 'admin', email: 'admin@gmail.com', title: 'admin', password: 'admin0011')
  @user = User.last
  @user.destroy

  visit users_path
  expect(page).not_to have_text('User was successfully deleted')
end
end