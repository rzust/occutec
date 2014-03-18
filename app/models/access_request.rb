class AccessRequest < ActiveRecord::Base

  state_machine :state, :initial => :opened do
      
    state :accepted, :rejected, :closed
    
    event :accept do
      transition :opened => :accepted
    end    
    event :reject do
      transition :opened => :rejected
    end

  end
  

end
