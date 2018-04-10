class ConversationsController < ApplicationController
    before_action :authenticate_traveler!
    
    #show all conversations for current traveler
    def index
        @conversations = Conversation.involving(current_traveler)
    end
    
    #create a new conversation between sender and recipient
    def create
        if Conversation.between(params[:sender_id], params[:recipient_id]).present?
            @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
        else
            @conversation = Conversation.create(conversation_params)
        end
        
        redirect_to conversation_messages_path(@conversation)
    end
    
    private
        
        #define the parameters needed to create a conversation
        def conversation_params
            params.permit(:sender_id, :recipient_id)
        end
end