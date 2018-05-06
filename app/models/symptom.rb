# frozen_string_literal: true

# Represents a Symptom
class Symptom < ApplicationRecord
  audited
  include Discard::Model

  default_value_for :description, ''
  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false }

  validates_length_of :name, \
                      within: 2..50, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'

  def to_s
    name
  end
end

# == Schema Information
#
# Table name: symptoms
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  description  :text             default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  discarded_at :datetime         not null
# Indexes
#
#  Name     (name) UNIQUE
#
