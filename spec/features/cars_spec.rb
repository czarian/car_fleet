require "rails_helper"

RSpec.feature "cars" do

let!(:user) { FactoryGirl.create(:user) }
let!(:car) { FactoryGirl.build(:car) }

scenario "Restrict adding new car withoud login" do

    visit new_car_path
    fill_in "Brand", with: car.brand
    fill_in "Registration number", with: car.reg_number

    click_on("Save")

    expect(page).to have_content("Log in")

  end

  scenario "Add car after user login" do

  login_as(user, :scope => :user)

    visit new_car_path
    fill_in "Brand", with: car.brand
    fill_in "Registration number", with: car.reg_number

    click_on("Save")

    expect(page).to have_content(car.brand)
  end

end
