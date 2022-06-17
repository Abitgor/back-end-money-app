class CategoryDecorator
  attr_reader :category

  delegate             :id,
                      :created_at,
                      :updated_at,
                      :user,
           to: :category

  def initialize(category)
    @category = category
  end

  def name
    category.name.downcase.capitalize
  end

  def costs_amount
    category.costs.pluck(:amount).sum
  end
end