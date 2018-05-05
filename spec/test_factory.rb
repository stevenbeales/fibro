# frozen_string_literal: true

# Factory to create or return test objects
class TestFactory
  def self.test_user
    @test_user ||= FactoryBot.create(:test_user)
  end
end
