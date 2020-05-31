class ChatroomController < ApplicationController
    before_action :require_user, only: [:index]
    def index
     @messages = Message.most_recent
     @message = Message.new
    end    
    
    
end