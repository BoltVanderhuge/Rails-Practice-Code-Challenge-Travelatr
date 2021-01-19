class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :bio, length: { minimum: 31 }

    def total_likes
        # all_likes = 0
        # self.posts.each do |post|
        #     all_likes += post.likes 
        # end
        # all_likes
        self.posts.inject(0) {|sum, post| sum + post.likes}
    end

    def most_popular
        self.posts.inject {|memo, post| post.likes > memo.likes ? post : memo}
    end

    # def top_five
    #     if !self.destinations.nil?
    #     five = self.posts.map{|post| post.destination.name}

    #     end
    # end

end
