module DateFilterSupportConcern
  include ActiveSupport::Concern

  def date_filter(params)
    return unless params[:start_date].present?
    start_date = params[:start_date]
    end_date = params[:end_date] || DateTime.now.end_of_day.to_s
    start_date = DateTime.parse(start_date).beginning_of_day
    end_date = DateTime.parse(end_date).end_of_day
    start_date...end_date
  end
end