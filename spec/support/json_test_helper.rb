# frozen_string_literal: true

module JsonTestHelper
  def json
    response&.parsed_body&.with_indifferent_access
  end
end
RSpec.configure do |config|
  config.include JsonTestHelper
end