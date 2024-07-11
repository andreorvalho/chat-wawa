class MessagesController < ApplicationController
  def create
    @message = Message.new(create_params.merge(user: current_user))

    if @message.save
      respond_to do |format|
        format.html { redirect_to messages_path, notice: "Message was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def create_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
