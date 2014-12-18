require 'spec_helper'
require 'data_mapper'
require 'order'

describe Order do
let(:order) { Order.new }

  it 'has an email' do
    order.email= "ahoy@yourma.com"
    expect(order.email).to eq "ahoy@yourma.com"
  end

  it 'has an address line 1' do 
    order.address_1= "8 Road of Roads"
    expect(order.address_1).to eq "8 Road of Roads"
  end

  it 'has an address line 2' do 
    order.address_2= "Line 2 address"
    expect(order.address_2).to eq "Line 2 address"
  end

  it 'has a postcode' do 
    order.postcode= "BT10"
    expect(order.postcode).to eq "BT10"
  end

  it 'has a product tag' do 
     order.product= "Madmax"
     expect(order.product).to eq "Madmax"
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
