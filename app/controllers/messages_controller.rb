class MessagesController < ApplicationController
    before_action :require_user, only: [:create]
    
    def create
    #   message = Message.new(message_params)
    #   message = current_user
        message = current_user.messages.build(message_params)
       if message.save
        #  redirect_to root_path
        ActionCable.server.broadcast "chatroom_channel", mod_message: message_rendering(message)
      end
    end  
    
    private
    def message_params
       params.require(:message).permit(:body) 
    end  
    
    def message_rendering(message)
       render(partial: 'message', locals: {message: message}) 
    end    
end    