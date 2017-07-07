class UserController < ApplicationController
	
	layout 'user'
	
	before_action :sprawdz_logowanie
  	
  	def index
  		@uzytkownik = Uzytkownik.find(params[:id])
  		@biegi = @uzytkownik.biegis.sortujData
  	end
end
