class Transaction
	attr_accessor :id, :product, :customer, :confirmation

	@@transactions = []
	@@id = 1
	@@unique_confirmations = []

	def initialize(customer, product)
		@customer = customer
		@product = product
		@id = @@id
		@@id += 1
		purchase_made
		@product.take_one_stock_away_after_purchase
		generate_order_confirmation
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

  protected

  def generate_order_confirmation
    unique_confirmation = rand(36**8).to_s(36)
    if !@@unique_confirmations.include? self.confirmation
      @@unique_confirmations << unique_confirmation
      @confirmation = unique_confirmation
    else
      generate_order_confirmation
    end 
  end

end