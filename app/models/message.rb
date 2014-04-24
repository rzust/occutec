class Message < ActiveRecord::Base
  state_machine :state, :initial => :unread do
      
    state :read, :unread
    
    event :read do
      transition :unread => :read
    end    

  end

  def state_name
    case state
    when "read"
      "Leído"
    when "unread"
      "Nuevo"
    end
    
  end
end
