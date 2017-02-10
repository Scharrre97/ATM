class Person

  attr_accessor :name,
                :cash,
                :account

  def initialize(attrs = {})
    @name = set_name(attrs[:name])
    @cash = 0
    @account = nil

  end

  def set_name(name)
   name == nil ? missing_name : name
  end

  def create_account
     @account = Account.new(owner: self)
  end

  def deposit(amount)
     @account == nil ? missing_account : deposit_funds(amount)
  end

  def withdraw(args = {})
     @account == nil ? missing_account : withdraw_funds(args)
  end

  def gimme_moneyz(moneyz)
     increase_cash(moneyz)
  end

  def steal_moneyz(greens)
     @cash = @cash - greens
  end


  private

  def missing_name
    raise ArgumentError, 'A name is required'
  end

  def missing_account
     raise RuntimeError, 'No account present'
  end

  def missing_atm
     raise RuntimeError, 'An ATM is required'
  end

  def increase_cash(amount)
     @cash += amount
  end

  def deposit_funds(amount)
     @cash -= amount
     @account.balance += amount
  end

  def withdraw_funds(args)
     args[:atm] == nil ? missing_atm : atm = args[:atm]
     account = @account
     amount = args[:amount]
     pin = args[:pin]
     response = atm.withdraw(amount, pin, account, atm)
     response[:status] ? increase_cash(amount) : response
  end
end
