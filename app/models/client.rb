class Client < ApplicationRecord
  has_one :registration, as: :user
end
