class Account
  attr_accessor :pin_code, :exp_date, :balance, :account_status
  STANDARD_VALIDITY_YRS = 5
  def initialize
    @pin_code = generate_pin
    @exp_date = set_expire_date
    @balance = 0
    @account_status = :active
  end

  def deactivate
    @account_status = :deactivated

  end

  def set_expire_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
end

  private

  def generate_pin
    rand(1000..9999)
  end
end
