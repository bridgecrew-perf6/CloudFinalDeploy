class Writing < ApplicationRecord
    validates :title, presence: true, length:{ minimum:5, maximum:20 }
    validates :body, presence: true, length:{ minimum:5, maximum:2000 }

    has_rich_text :body
    has_one :content, class_name: 'ActionText::RichText', as: :record, dependent: :destroy

    has_many :corrections, dependent: :destroy
    
    belongs_to :user
end
