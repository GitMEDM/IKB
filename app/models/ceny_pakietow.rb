class CenyPakietow < ApplicationRecord

	belongs_to :biegi

	scope :sortujData, lambda{order("ceny_pakietows.data ASC")}
end
