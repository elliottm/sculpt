require 'spec_helper'
require 'data_mapper'
require 'user'

describe User do

let(:user) { User.new }

  it 'has a name' do
    user.name= "Mark"
    expect(user.name).to eq "Mark"
  end

  it 'has an email' do
    user.email= "ahoy@yourma.com"
    expect(user.email).to eq "ahoy@yourma.com"
  end

  # it "with a password that doesn't match" do
  #   all_users = User.all
  #   lambda { sign_up('a@a.com', 'pass', 'wrong') }.should change(all_users, :count).by(0)    
  # end

  # def sign_up(email = "alice@example.com", 
  #             password = "oranges!", 
  #             password_confirmation = "oranges!")
  #   visit '/user/new'
  #   fill_in :email, :with => email
  #   fill_in :password, :with => password
  #   fill_in :password_confirmation, :with => password_confirmation
  #   click_button "Sign up"
  # end

  # feature "User signs in" do

  # before(:each) do
  #   User.create(:email => "test@test.com", 
  #               :password => 'test', 
  #               :password_confirmation => 'test')
  # end

end

# feature "User signs up" do
 
#   scenario "when being logged out" do    
#     lambda { sign_up }.should change(User, :count).by(1)    
#     expect(page).to have_content("Welcome, alice@example.com")
#     expect(User.first.email).to eq("alice@example.com")        
#   end

#   def sign_up(email = "alice@example.com", 
#               password = "oranges!")
#     visit '/users/new'
#     expect(page.status_code).to eq(200)
#     expect(page.status_code).to eq(200)
#     fill_in :email, :with => email
#     fill_in :password, :with => password
#     click_button "Sign up"
#   end

# end