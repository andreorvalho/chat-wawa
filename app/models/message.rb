class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :content, presence: true, allow_blank: false

  after_create_commit ->(message) {
    broadcast_append_to [message.chatroom, "messages"]
  }
end
