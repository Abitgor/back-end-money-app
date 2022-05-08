decorated_cost = CostDecorator.new(category)

json.extract! decorated_cost, :crated_at, :updated_at, :category_name, :amount, :currency