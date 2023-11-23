require 'rails_helper'

RSpec.describe 'categories/new.html.erb', type: :view do
  before do
    assign(:category, Category.new)
    render
  end

  it 'displays the Create Category form' do
    expect(rendered).to have_selector('div', text: 'ADD NEW CATEGORY')
  end
end
