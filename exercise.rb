class BankAccount

  @@interest_rate =
  @@accounts = []

  attr_reader :balance
  attr_writer :balance

  def initialize()
    @balance = 0
  end

  def deposit(n)
    @balance = @balance + n
  end

  def withdraw(n)
    @balance = @balance - n
  end

  def self.create
    @@accounts << BankAccount.new
  end

  def self.total_funds
    return @@accounts.sum
  end

  def self.interest_time
    @@accounts.each do |a|
      return a * @@interest_rate
    end
  end

end
