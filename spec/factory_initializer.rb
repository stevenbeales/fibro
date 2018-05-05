# frozen_string_literal: true

# Passes find_or_create associations to Factory bot
class FactoryInitializer
  def self.test_user
    User.find_or_create_by! user_id: TestConstants::TEST_USER
  end
end
