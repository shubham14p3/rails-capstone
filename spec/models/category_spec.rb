require 'rails_helper'

RSpec.describe User, type: :model do
    before(:each) do
        @user = User.create(username: 'seth', email: 'cool@q.com', password: '12345678')
        @article = Article.create(author_id: @user.id, title:"My first...", text:"This is my ...", image:"")
        @category = Category.create(name: "Surfing", priority: 1)
        @bac = BridgeArticleCategory.create(article_id: @article.id, category_id: @category.id)
         
    end
    context 'tests the article model creation' do
        it 'create valid category' do
            expect(@category.valid?).to eq(true)
        end
        it 'create valid bac' do
            expect(@bac.valid?).to eq(true)
        end
    end
end