require "rails_helper"

RSpec.feature "Mileage test" do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:car) { FactoryGirl.create(:car, user: user) }
  let!(:mileage) {FactoryGirl.build(:mileage, user: user, car: car) }

  before(:each) do

    login_as(user, :scope => :user)
    visit new_car_path
    fill_in "Brand", with: car.brand
    fill_in "Registration number", with: car.reg_number

    click_on("Save")
  end


  scenario "Add mileage" do
    fill_in "Number of kilometers", with: mileage.value

    click_on("Add mileage")

    expect(page).to have_content(mileage.value)


  end

  scenario "Restrict adding mileage with value other than float" do

    fill_in "Number of kilometers", with: "some value"

    click_on("Add mileage")

    expect(page).to_not have_content("some value")
    expect(page).to have_content("There is an error try again later")
  end

  scenario "Check average milage" do
    fill_in "Number of kilometers", with: mileage.value
    select 'January', :from => 'month'

    click_on("Add mileage")

    fill_in "Number of kilometers", with: mileage.value
    select 'February', :from => 'month'

    click_on("Add mileage")

    visit cars_path
    expect(page).to have_content(mileage.value)
    expect(page).to have_content(mileage.value*2)
  end

  scenario "Restrict adding milage for the same month" do
    fill_in "Number of kilometers", with: mileage.value
    select 'January', :from => 'month'

    click_on("Add mileage")

    fill_in "Number of kilometers", with: mileage.value
    select 'January', :from => 'month'

    click_on("Add mileage")

    expect(page).to have_content("There is an error try again later")
  end

end
