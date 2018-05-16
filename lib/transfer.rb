require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if BankAccount.new(@sender).valid? == true && BankAccount.new(@receiver).valid? == true
      return true
    else 
      return false
    # if sender_status == true && receiver_status == true
    #   return true
    # else
    #   return false
    end
  end
end
