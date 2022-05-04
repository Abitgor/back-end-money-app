# frozen_string_literal: true

class Cost < ApplicationRecord
  has_one :cost_comment
  belongs_to :category
  belongs_to :user
end
