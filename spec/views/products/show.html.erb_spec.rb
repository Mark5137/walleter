# frozen_string_literal: true

require "rails_helper"

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
                                  name: "Name",
                                  description: "Description",
                                  price: 2
                                ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
  end
end
