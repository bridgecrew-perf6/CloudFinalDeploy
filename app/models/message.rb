class Message < ApplicationRecord
    belongs_to :user
    belongs_to :room

    after_create_commit { broadcast_append_to room }
    before_create :confirm_participant

    has_many_attached :attachments, dependent: :destroy


    # Helper to add attachements
    def chat_attachment(index)
        target = attachments[index]
        return unless attachments.attached?

        # Resize any images or videos
        if target.image?
            target.variant(resize_to_limit: [150, 150]).processed
        elsif target.video?
            target.variant(resize_to_limit: [150, 150]).processed
        end
    end



    # Check if someone is a participant if room is private
    def confirm_participant
        return unless room.is_private

        # Throw an abort if the user isnt a participant
        is_participant = Participant.where(user_id: user.id, room_id: room.id).first
        throw :abort unless is_participant
    end
end
