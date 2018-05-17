# frozen_string_literal: true

# Represents a Symptom log Entry
class SymptomLogEntry < ApplicationRecord
  # Adds support for storing all data changes into audit table
  audited
  # Adds soft delete support (calling discard rather than destroy)
  include Discard::Model

  SEVERITY_ARRAY = %w[None Mild Moderate Severe Very\ Severe].freeze

  enum severity: SEVERITY_ARRAY

  belongs_to :symptom
  validates :symptom, presence: true
  validates_associated :symptom

  belongs_to :symptom_log, inverse_of: :symptom_log_entries, touch: true
  validates :symptom_log, presence: true
  validates_associated :symptom_log

  default_value_for :entry_date, Time.now
  validates :entry_date, presence: true
  validates_datetime :entry_date

  default_value_for :severity, 'Moderate'
  validates :severity, presence: true
  validates :severity, inclusion: { in: SEVERITY_ARRAY }

  # default to moderate score
  default_value_for :score, 5
  validates_numericality_of :score, only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10
  validates :score, presence: true

  delegate :user, to: :symptom_log

  def to_s
    %(#{entry_date} #{symptom} #{score})
  end
end

# == Schema Information
#
# Table name: symptoms
#
#  id           :integer          not null, primary key
#  symptom_log_id  :integer   not null, foreign key
#  symptom_id   :integer      not null, foreign key
#  severity     :integer        not null
#  score         :integer      not null,
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  discarded_at :datetime         not null
#
