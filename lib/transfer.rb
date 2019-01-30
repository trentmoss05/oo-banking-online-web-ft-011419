class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.sender.valid?
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
    else

      self.sender.balance = self.sender.balance - @amount
      self.receiver.balance = self.receiver.balance + @amount
      @status = "complete"
    end
  end

  def reverse_transfer
      if @status == "complete"
        self.sender.balance = self.sender.balance + @amount
        self.receiver.balance = self.receiver.balance - @amount
        @status = "reversed"
      else
    end
  end

end
