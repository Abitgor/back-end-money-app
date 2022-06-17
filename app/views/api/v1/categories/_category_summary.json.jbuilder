

decorated_category = CategoryDecorator.new(category)

json.extract! decorated_category, :id, :name,:created_at,:updated_at, :costs_amount