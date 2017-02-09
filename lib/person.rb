class Person

  attr_accessor :name

  def initialize(attrs = {})
    @name = attrs[:name]
  end
end
