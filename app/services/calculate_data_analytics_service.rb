class CalculateDataAnalyticsService
  attr_reader :user
  def initialize(user)
    @user = user
  end

  def calculate!
    {
      costs_line: costs_line,
      incomes_line: incomes_line,
      category_spend: category_spend
    }
  end

  private
  def category_spend
    categories_spend = []
    user.costs.where("costs.created_at > ?", (Time.now-6.days).beginning_of_day).joins(:category).group("categories.name").select("SUM(costs.amount) as total_amount","categories.name as category_name").each do |statistic|
      categories_spend << {
        total: statistic.total_amount,
        category: statistic.category_name
      }
    end
    categories_spend
  end
  def incomes_line
    income_line = []
    total = 0
    user.incomes.where("created_at > ?", (Time.now-6.days).beginning_of_day).group("created_at::date").select("SUM(incomes.amount) as total_amount","incomes.created_at::date as created_date").each do |statistic|
      total += statistic.total_amount
      income_line << {
        total: total,
        date: statistic.created_date.strftime("%d/%m")
      }
    end
    make_fool_statistic(income_line)
  end

  def costs_line
    cost_line = []
    total = 0
    user.costs.where("created_at > ?", (Time.now-6.days).beginning_of_day).group("created_at::date").select("SUM(costs.amount) as total_amount","costs.created_at::date as created_date").each do |statistic|
      total += statistic.total_amount
      cost_line << {
        total: total,
        date: statistic.created_date.strftime("%d/%m")
      }
    end
    make_fool_statistic(cost_line)
  end

  def make_fool_statistic(statistic)
    if statistic.size > 0
      7.times do |i|
          unless statistic[i].present? && statistic[i][:date] == date_range[i]
            if i == 0
              statistic.insert(i,{date: date_range[i], total: 0})
            else
              statistic.insert(i,{date: date_range[i], total: statistic[i-1][:total]})
            end
          end
          unless statistic[i].present?
            statistic.insert(i, { date: date_range[i], total: statistic[i - 1][:total] })
          end
      end
    else
      statistic = date_range.map { |date| {date: date, total: 0} }
    end
    statistic
  end

  def date_range
    ((Date.today-6.days)..Date.today).map {|d| d.strftime("%d/%m")}
  end
end