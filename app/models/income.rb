class Income < ApplicationRecord
  belongs_to :user
  before_create :set_currency

  def set_currency
    self.currency = user.currency
  end
end
