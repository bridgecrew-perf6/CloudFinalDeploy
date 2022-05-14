class Reading < ApplicationRecord
    has_rich_text :body
    has_one :content, class_name: 'ActionText::RichText', as: :record, dependent: :destroy

    has_many :reading_problems, dependent: :destroy
end
