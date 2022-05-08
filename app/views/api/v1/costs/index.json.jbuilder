json.status 200
json.costs do
  json.array! @costs, partial: 'api/v1/costs/cost_summary', as: :cost
end