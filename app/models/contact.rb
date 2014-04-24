class Contact < ActiveRecord::Base

  class << self
    def by_state
      contacts = Contact.where(main: false)
      states = contacts.collect{|x| x.state}
      response = Hash.new
      states.each{ |x| response["#{x.downcase}"] = Array.new }
      contacts.each do |x|
        response["#{x.state.downcase}"] << x
      end
      return response
    end
  end

end
