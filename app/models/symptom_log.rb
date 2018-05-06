# frozen_string_literal: true

# Represents a Symptom Log
class SymptomLog < ApplicationRecord
  audited
  include Discard::Model

  belongs_to :user, inverse_of: :symptom_log
  validates :user, presence: true
  validates_associated :user
  validates_uniqueness_of :user

  def to_s
    %(#{user}'s symptom log)
  end
end

# == Schema Information
#
# Table name: symptoms
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null, foreign keys
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  discarded_at :datetime         not null
# Indexes
#
