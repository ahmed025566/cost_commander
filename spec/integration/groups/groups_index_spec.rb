require 'rails_helper'

RSpec.describe 'Groups', type: :system do
  describe 'groups index page' do
    before(:each) do
      user = User.create(name: 'Ahmad', email: 'test@example.com', password: 'password')
      Group.create(name: 'Utilties',
                   icon: 'http://localhost:3000/assets/gas-e01f85c6657a9fd76baebb9757af906fa1396a35b89231d5260659bcafafbbe0.jpegs',
                   user:)
      sign_in user
      visit groups_path
    end
    let(:groups) { Group.all }
    it 'should find the group name' do
      groups.each do |group|
        expect(page).to have_content(group.name)
      end
    end
    it 'displays a link to add a recipe' do
      expect(page).to have_link('Add new category', href: new_group_path)
    end

    it 'should find the group creation date' do
      groups.each do |_group|
        expect(page).to have_content('2 Dec 2023')
      end
    end

    it 'should find the group photo' do
      groups.each do |_group|
        expect(page).to have_css("img[src*='http://localhost:3000/assets/gas-e01f85c6657a9fd76baebb9757af906fa1396a35b89231d5260659bcafafbbe0.jpegs']")
      end
    end

    it 'should find the totoal amount of 0 for now' do
      groups.each do |_group|
        expect(page).to have_content('$0')
      end
    end
  end
end
