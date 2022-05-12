class Question < ApplicationRecord
    extend FriendlyId

    validates :title, presence: true, length:{ minimum:5, maximum:40 }
    validates :level, presence: true
    validates :keyword, presence: true
    validates :body, presence: true, length:{ minimum:5, maximum:100 }
    validates :answer, presence: true, length:{ minimum:5, maximum:50 }
    validates :prompt, presence: true, length:{ minimum:5, maximum:100 }


    belongs_to :user

    has_many :comments, dependent: :destroy

    has_noticed_notifications model_name: "Notification"
    has_many :notifications, through: :user

    # Friendly ID to make url look nicer
    friendly_id :title, use: %i[slugged history finders]


    # Generate a new friendly id when created or title changed
    def should_generate_new_friendly_id?
        title_changed? || slug.blank?
    end

end
