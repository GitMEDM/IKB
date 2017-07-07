class Uzytkownik < ApplicationRecord

	has_many :biegis

	has_secure_password

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates 		:imie,
					:presence => {:in => true, :message => "Imię nie może być puste"}

	validates 		:nazwisko,
					:presence => {:in => true, :message => "Nazwisko nie może być puste"}

	validates 		:uzytkownik,
					:length => {:within => 4..25, :message => "Nazwa użytkownika musi zawierać się pomiędzy 4, a 25 znaków"},
					:uniqueness => true

	validates 		:email,
					:presence => true,
					:length => {:maximum => 100},
					:format => {:with => EMAIL_REGEX, :message => "Nie poprawny format, poprawny format to np. jnowak@gmail.com"},
					:confirmation => true

	scope :sortuj, lambda{order("nazwisko ASC, imie ASC")}
end
