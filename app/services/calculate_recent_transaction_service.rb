class CalculateRecentTransactionService
  attr_reader :user
  def initialize(user)
    @user=user
  end

  def calculate!
    (incomes+costs).sort_by { |hsh| hsh[:date] }.reverse.first(100)
  end

  private

  def incomes
    user_incomes = []
    user.incomes.distinct.find_each do |income|
      user_incomes << { type: "income",
                        currency: income.currency,
                        category: income.source,
                        comment: income.comment,
                        date: income.created_at.strftime("%d/%m/%Y"),
                        amount: income.amount
      }
    end
    user_incomes
  end

  def costs
    user_costs = []
    user.costs.distinct.includes(:cost_comment, :category).find_each do |cost|
      decorated_cost = CostDecorator.new(cost)
      user_costs << { type: "cost",
                      currency: decorated_cost.currency,
                      category: decorated_cost.category_name,
                      comment: decorated_cost.cost_description,
                      date: decorated_cost.created_at.strftime("%d/%m/%Y"),
                      amount: decorated_cost.amount
                  }
    end
    user_costs
  end
end