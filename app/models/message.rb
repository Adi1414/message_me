class Message < ApplicationRecord
    belongs_to :user
     validates :body , presence: true, length: {maximum: 200, minimum: 3}
     validates :user_id , presence: true
     
    def self.most_recent
       order(:created_at).last(20)
    end  
  
end
