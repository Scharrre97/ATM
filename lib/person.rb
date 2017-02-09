class Person

  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    @name = set_name(attrs[:name])
    @cash = 0
    @account = nil

  end

  def set_name(name)
  name == nil ? missing_name : name
  end

  private


  def missing_name
    raise ArgumentError, 'A name is required'

  end
end
