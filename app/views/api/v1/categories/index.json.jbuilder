json.status 200
json.categories do
  json.array! @categories, partial: 'api/v1/categories/category_summary', as: :category
end