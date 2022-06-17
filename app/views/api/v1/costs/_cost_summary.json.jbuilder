decorated_cost = CostDecorator.new(cost)

json.extract! decorated_cost, :id, :created_at, :updated_at, :category_name, :amount, :currency, :cost_description