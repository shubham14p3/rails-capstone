require 'rails_helper'

RSpec.describe User, type: :model do
    before(:each) do
        @user = User.create(name: 'seth', email: 'cool@q.com', password: '12345678')
        @article = Article.create(author_id: @user.id, title:"My first...", text:"This is my ...", image:"")
        @category = Category.create(name: "Surfing", priority: 1)
    end
    context 'tests the category model creation' do
        it 'create valid category' do
            expect(@category.valid?).to eq(true)
        end
    end
    context 'tests the category validation' do
        it 'create invalid category due to validation' do
        @category2 = Category.new(name: "Surfing", priority: 2)
        expect(@category2.valid?).to eq(false)
        end
    end
end