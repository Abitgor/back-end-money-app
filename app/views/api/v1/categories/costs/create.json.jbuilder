json.status 200
json.cost do
  json.partial! "api/v1/costs/cost_summary", category: @cost
end