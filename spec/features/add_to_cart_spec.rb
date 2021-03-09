require 'rails_helper'
 
RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
   @category = Category.create! name: 'Apparel'
    User.create! first_name: 'fake', last_name: 'fakey', email: 'myname@fake.com',   password: '123456789', password_confirmation:'123456789'
     10.times do |n|
       @category.products.create!(
         name:  Faker::Hipster.sentence(3),
         description: Faker::Hipster.paragraph(4),
         image: open_asset('apparel1.jpg'),
         quantity: 10,
         price: 64.99
       )
  
  
    end
  
  end
 
  scenario "Cart updates by one" do
  visit root_path
  expect(page).to have_content('My Cart (0)')
 
  first('.product').click_button('Add')
  page.fill_in('email', with: 'myname@fake.com')
  page.fill_in('password', with: '123456789')
  page.click_button('Submit')
  expect(page).to have_content('fake')
  first('.product').click_button('Add')
  expect(page).to have_content('My Cart (1)')
  
  
  save_screenshot "My_Cart_updated_last.png"

  end

end
