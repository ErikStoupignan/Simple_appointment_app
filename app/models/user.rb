class User < ApplicationRecord
  has_many :appointments, dependent: :delete_all

end
