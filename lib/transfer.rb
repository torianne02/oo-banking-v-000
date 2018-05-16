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
    sender_status = BankAccount.new(@sender).valid?
    receiver_status = BankAccount.new(@receiver).valid?
    binding.pry
    if sender_status == true && receiver_status == true
      true
    else
      false
    end
  end
end
