class Comment < ApplicationRecord
    belongs_to :user 
    belongs_to :image

    def comment_date 
        self.created_at.strftime("%B %d, %Y")
    end
end
