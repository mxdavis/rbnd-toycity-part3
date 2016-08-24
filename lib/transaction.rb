class Transaction
	attr_accessor :id, :product, :customer

	@@transactions = []
	@@unique_ids = []

	def initialize(customer, product)
		@customer = customer
		@product = product
		generate_id
		purchase_made
		@product.take_one_stock_away_after_purchase
	end

	def purchase_made
    if product.in_stock?
      @@transactions << self
    else 
      raise NoStockProductError, "#{product} is out of stock"
    end
  end

  def self.all
  	@@transactions
  end

	protected
	  def generate_id
      unique_id = rand(36**8).to_s(36)
      if !@@unique_ids.include? self.id
      @@unique_ids << unique_id
      @id = unique_id
    else
      generate_id
    end 
  end
end