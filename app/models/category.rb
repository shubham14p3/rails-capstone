class Category < ApplicationRecord
    has_many :tags
    has_many :articles, through: :tags

    validates :name, uniqueness: true

    def self.top_priority
        # And this is how you avoid n+1 problems
        Category.order("priority ASC").limit(4).includes(:articles)
        # categories.each do |cat|
        #     p cat.name
        #     p cat.articles.last.title
        #     p cat.articles.last.text.truncate(50)
        # end
    end

end
