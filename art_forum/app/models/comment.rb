class Comment < ApplicationRecord
    belongs_to :user 
    belongs_to :image

    validates :text, :user_id, :image_id, presence: true
    validates :text, length: {maximum: 250}

    def comment_date 
        self.created_at.strftime("%I:%M on %B %d, %Y")
    end

    def error_message 
        "Comment must be less than 250 characters and cannot be blank"
    end
end
