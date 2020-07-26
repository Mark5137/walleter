# frozen_string_literal: true

require "rails_helper"

feature "products", type: :feature do
  scenario "Creates a new Product" do
    visit "/products/new"
    within find("form") do
      fill_in "Name", with: ""
      fill_in "Description", with: ""
      fill_in "Price", with: ""
    end
    click_button "Create Product"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
    expect(page).to have_content "Price can't be blank"
    expect(page).to have_content "Price is not a number"

    within find("form") do
      fill_in "Name", with: Faker::Lorem.sentence
      fill_in "Description", with: Faker::Lorem.sentence
      fill_in "Price", with: Faker::Number.digit
    end
    click_button "Create Product"
    expect(page).to have_content "Product was successfully created."

    click_link "Edit"
    within find("form") do
      fill_in "Name", with: Faker::Lorem.sentence
      fill_in "Description", with: Faker::Lorem.sentence
      fill_in "Price", with: Faker::Number.digit
    end
    click_button "Update Product"
    expect(page).to have_content "Product was successfully updated."

    click_link "Back"
    accept_confirm do
      click_link "Destroy"
    end
    expect(page).to have_content "Product was successfully destroyed."
  end
end
