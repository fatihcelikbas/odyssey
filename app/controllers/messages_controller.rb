class MessagesController < ApplicationController
    before_action :authenticate_traveler!
    before_action :set_conversation
    
    #show the messages between this ocnversations sender and recipient
    def index
        if current_traveler == @conversation.sender || current_traveler == @conversation.recipient
            @other = current_traveler == @conversation.sender ? @conversation.recipient : @conversation.sender
            @messages = @conversation.messages.order("created_at DESC")
        else
            redirect_to conversations_path, alert: "You don't have permission to view this."
        end
    end
    
    #create a new message and send it
    def create
        @message = @conversation.messages.new(message_params)
        @messages = @conversation.messages.order("created_at DESC")
        
        if @message.save
            ActionCable.server.broadcast "conversation_#{@conversation.id}", message: render_message(@message)
        end
    end
    
    private
        
        #find the conversation based on the id given
        def set_conversation
           @conversation = Conversation.find(params[:conversation_id]) 
        end
        
        #render the message
        def render_message(message)
            self.render(partial: 'messages/message', locals: {message: message})
        end
        
        #define the parameters needed for a guide review
        def message_params
            params.require(:message).permit(:context, :traveler_id)
        end
end