class BankAccount

  @@interest_rate = 0.01
  @@accounts = []

  def balance
    return @balance
  end

  def balance=(x)
    @balance = x
  end

  # attr_accessor :balance

  def initialize
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
    return @@accounts.last
  end

  def self.total_funds
    total = 0
    @@accounts.each do |account|
      total += account.balance
    end
    return total
  end

  def self.interest_time
    @@accounts.each do |a|
    # a.balance *= (@@interest_rate + 1)

    # a.balance = a.balance * (@@interest_rate + 1)

    a.balance=(a.balance * (@@interest_rate + 1))

    end
  end

end


my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance # 0
puts BankAccount.total_funds # 0
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance # 200
puts your_account.balance # 1000
puts BankAccount.total_funds # 1200
BankAccount.interest_time
puts my_account.balance # 202.0
puts your_account.balance # 1010.0
puts BankAccount.total_funds # 1212.0
my_account.withdraw(50)
puts my_account.balance # 152.0
puts BankAccount.total_funds # 1162.0
