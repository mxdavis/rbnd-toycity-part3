class Customer
  attr_accessor :name

  @@customers = []

  def initialize(options={})
   @name = options[:name]
   add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(customer_name)
    @@customers.find {|customer| customer.name == customer_name}
  end

  def purchase(item)
    Transaction.new(self.name, item)
  end

  private

   def add_to_customers
    unique_name = @@customers.map {|customer| customer.name}
    if !unique_name.include? self.name
      @@customers << self
    else
      raise DuplicateProductError, "#{self.name} already exists"
    end
  end
end