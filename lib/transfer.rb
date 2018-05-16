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
    end
  end

  def execute_transaction
    if self.valid? == true
      sender_new_balance = BankAccount.new(@sender).balance - @amount
      receiver_new_balance = BankAccount.new(@sender).deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
end
