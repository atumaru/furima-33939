# frozen_string_literal: true

class Delivery < ApplicationRecord
  belongs_to :order
end
