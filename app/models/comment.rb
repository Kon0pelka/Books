class Comment < ApplicationRecord
    belongs_to :book
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :info, presence: true, length: { maximum: 140 }

    def moder
        update_attribute(:activ, true)
    end
end
