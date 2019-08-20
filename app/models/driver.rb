class Driver < ApplicationRecord
  has_one :registration, as: :user
end
