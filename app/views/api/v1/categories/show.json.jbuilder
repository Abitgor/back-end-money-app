json.status 200
json.category do
  json.partial! "api/v1/categories/category_summary", category: @category
end