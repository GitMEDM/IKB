class Biegi < ApplicationRecord

	has_many :ceny_pakietows

	scope :sortujData, lambda{order("biegis.data ASC")}
end
