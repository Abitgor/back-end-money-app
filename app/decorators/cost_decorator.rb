class CostDecorator
  attr_reader :cost

  delegate :id,
            :created_at,
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
    category.name&.downcase.capitalize
  end

  def cost_description
    cost.cost_comment&.cost_description
  end
end