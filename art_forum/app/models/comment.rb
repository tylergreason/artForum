class Comment < ApplicationRecord
    belongs_to :user 
    belongs_to :image

    validates :text, :user_id, :image_id, presence: true

    def comment_date 
        self.created_at.strftime("%B %d, %Y, at %I:%M")
    end
end
