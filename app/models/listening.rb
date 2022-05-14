class Listening < ApplicationRecord
    has_one_attached :song_file

    has_many :listening_options, dependent: :destroy
end
