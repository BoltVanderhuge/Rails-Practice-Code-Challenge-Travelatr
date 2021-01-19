class Destination < ApplicationRecord
has_many :posts
has_many :bloggers, through: :posts

def five_recent
    self.posts.order("created_at desc").limit(5)
end

def most_popular
    self.posts.inject {|memo, post| post.likes > memo.likes ? post : memo}
end

def average_age
    unique_users = self.bloggers.uniq
    # self.users.each do |user|
    #     if !unique_users.find(user)
    #         unique_users << user
    #     end
    # end
    if unique_users.count > 0
        (unique_users.inject(0) {|sum, blogger| sum + blogger.age}) / (unique_users.count)
    else
        nil
    end

end

end
