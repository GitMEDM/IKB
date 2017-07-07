class Biegi < ApplicationRecord

	belongs_to :uzytkownik
	has_many :ceny_pakietows

	scope :sortujData, lambda{order("biegis.data ASC")}
end
