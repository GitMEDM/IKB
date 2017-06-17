class TestController < ApplicationController

	layout false

  def index
  	#to jest odwolanie do pliku index.html.erb
  	@testowa = "Witam w kursie RoR"
    @imiona = ["ala", "ewa", "ola"]
    @id = params[:id].to_i
  end

  def test
  	render('witaj')
  end

  def google
  	redirect_to('http://www.google.pl')
  end

end