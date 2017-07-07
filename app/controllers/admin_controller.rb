class AdminController < ApplicationController

	layout 'admin'

	before_action :sprawdz_logowanie

  	def index
  	end
end
