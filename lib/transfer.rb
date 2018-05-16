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
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && @status == "pending"
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.deposit(@amount)
      @status = "complete"
    elsif valid? == false
      @status = "rejected"
      puts "Transaction rejected. Please check your account balance."
    end
  end
end
