class CostDecorator
  attr_reader :cost

  delegate :crated_at,
           :updated_at,
           :user,
           :category,
           :amount,
           :currency,
           to: :cost

  def initialize(cost)
    @cost = cost
  end

  def category_name
    category.name.downcase.capitalize
  end
end