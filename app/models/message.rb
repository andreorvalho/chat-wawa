class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :content, presence: true, allow_blank: false

  after_create_commit -> { broadcast_append_to "messages", partial: "messages/message", locals: { message: self }, target: "messages" }
end
