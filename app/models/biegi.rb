class Biegi < ApplicationRecord

	has_many :oplata_startowas

	scope :sortujData, lambda{order("biegis.data ASC")}
end
