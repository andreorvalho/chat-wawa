class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :content, presence: true, allow_blank: false

  #after_create_commit ->(message) { broadcast_append_to "messages_#{message.chatroom.name}", partial: "messages/message", locals: { message: self }, target: "messages_#{message.chatroom.name}" }

  broadcasts_to ->(message) { [message.chatroom, "messages"] }, inserts_by: :append
end
