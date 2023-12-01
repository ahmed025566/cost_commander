require 'rails_helper'

RSpec.describe 'Grups', type: :system do
  describe 'group show page' do
    before(:each) do
      user = User.create(name: 'Ahmad', email: 'test@example.com', password: 'password')
      @group = Group.create(name: 'Utilties',
                            icon: 'http://localhost:3000/assets/gas-e01f85c6657a9fd76baebb9757af906fa1396a35b89231d5260659bcafafbbe0.jpegs',
                            user:)
      @entity = Entity.create(name: 'Gas', amount: 55, groups: '@group.name', author: user)
      sign_in user
      visit group_path(@group)
    end

    it 'should have the entities that belongs to it' do
      expect(page).to have_content(@entity.name)
    end

    it 'should have the amount of the transaction' do
      expect(page).to have_content(@entity.amount)
    end

    it 'should have the date of creation to the transaction' do
      expect(page).to have_content('1 Dec 2023')
    end
  end
end
