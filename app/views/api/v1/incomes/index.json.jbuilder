json.status 200
json.incomes do
  json.array! @incomes, partial: 'api/v1/incomes/income_summary', as: :income
end