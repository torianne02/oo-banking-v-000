class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender_status = BankAccount.new(@sender).valid?(true)
    receiver_status = BankAccount.new(@receiver).valid?(true)
    if sender_status == true && receiver_status == true
      true
    else
      false
    end
  end
end
