class User < ApplicationRecord
  has_one :user_information
  has_many :social_accounts
  has_many :connect_histories
end
