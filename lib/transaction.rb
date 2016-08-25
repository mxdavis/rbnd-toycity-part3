class Transaction
	attr_reader :id, :product, :customer

	@@transactions = []
	@@id = 1

	def initialize(customer, product)
		@customer = customer
		@product = product
		@id = @@id
		@@id += 1
		purchase_made
		@product.take_one_stock_away_after_purchase
	end

	def purchase_made
    if product.in_stock?
      @@transactions << self
    else 
      raise OutOfStockError, "#{self.product.title} is out of stock"
    end
  end

  def self.all
  	@@transactions
  end


  def self.find(id_no)
    @@transactions.find { |transaction| transaction.id == id_no }
  end
end