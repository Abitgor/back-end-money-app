decorated_cost = CostDecorator.new(cost)

json.extract! decorated_cost, :crated_at, :updated_at, :category_name, :amount, :currency, :cost_description