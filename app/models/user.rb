# frozen_string_literal: true

# Represents an application user/respondent
# Users are linked to Alexa users using Alexa session request.user_id
class User < ApplicationRecord
  audited
  include Discard::Model

  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9._@\-,=+]*\z/

  has_one :symptom_log, inverse_of: :user
  has_many :symptom_log_entries, through: :symptom_log
  default_value_for :access_token, ''
  validates :user_id,
            presence: true,
            format: { with: VALID_USERNAME_REGEX },
            uniqueness: { case_sensitive: false }
  validates_length_of :user_id, \
                      within: 1..64, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'

  after_initialize :create_symptom_log

  def self.authenticate(user_id)
    user = User.find_or_create_by(user_id: user_id)
    user
  end

  def to_s
    user_id
  end

  private

  def create_symptom_log
    self.symptom_log ||= SymptomLog.new(user: self) if new_record?
  end
end

# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  user_id      :string           not null
#  access_token :text             default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  user_id     (user_id) UNIQUE
#