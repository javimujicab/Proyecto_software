class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def create
    sender_id = params[:sender_id]
    recipient_id = params[:recipient_id]

    @conversation = Conversation.between(sender_id, recipient_id).first

    unless @conversation
      @conversation = Conversation.create!(sender_id: sender_id, recipient_id: recipient_id)
    end

    redirect_to conversation_messages_url(@conversation)
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy
    redirect_to conversations_path
  end


  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

end

