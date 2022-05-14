class Correction < ApplicationRecord
    belongs_to :writing
    belongs_to :user


    has_rich_text :body
end
