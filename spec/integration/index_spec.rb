require 'rails_helper'

RSpec.describe 'categories/index.html.erb', type: :view do
  describe 'Index page' do
    before(:each) do
      @user = User.new(name: 'Zohra', email: 'zohra.neda@gmail.com', password: '123456')
      @user.save
      @category1 = Category.new(author: @user, name: 'Foods', icon: 'image1_url')
      @category1.save
      @category2 = Category.new(author: @user, name: 'Clothes', icon: 'image2_url')
      @category2.save
      @transaction1 = Exchange.create(author: @user, name: 'Burger', category: @category1, amount: 2)
      @transaction2 = Exchange.create(author: @user, name: 'Fries', category: @category1, amount: 3)
      assign(:categories, Category.all)
    end

    before do
      render
    end

    it 'shows the right page' do
      expect(rendered).to have_content('Categories')
    end

    it 'shows a category name' do
      expect(rendered).to have_content('Clothes')
    end

    it 'displays the correct content' do
      expect(rendered).to have_selector('p', text: 'Foods')
      expect(rendered).to have_selector('p', text: 'Clothes')
      expect(rendered).to have_selector('p', text: '$5')
      expect(rendered).to have_selector('p', text: '$0')
      expect(rendered).to have_selector('button', text: 'Add a new Category')
    end
  end
end
