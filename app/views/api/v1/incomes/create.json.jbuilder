json.status 200
json.income do
  json.partial! "api/v1/incomes/income_summary", income: @income
end