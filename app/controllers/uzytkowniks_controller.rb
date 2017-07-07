class UzytkowniksController < ApplicationController

  	layout 'admin'

    before_action :sprawdz_logowanie

  	def index
  		@uzytkownik = Uzytkownik.sortuj
  	end

  	def edycja
  		@uzytkownik = Uzytkownik.find(params[:id])
  	end

  	def aktualizuj
  		  @uzytkownik = Uzytkownik.find(params[:id])
  		  if @uzytkownik.update_attributes(uzytkownik_parametry)
      			flash[:notice] = "Dane użytkownika #{@uzytkownik.uzytkownik} zostały pomyślne zmodyfikowane"
      			redirect_to(:action => "index")
    		else
    		    render("edycja")
    		end
  	end

    def usun
        @uzytkownik = Uzytkownik.find(params[:id])
    end

    def kasuj
        uzytkownik = Uzytkownik.find(params[:id]).destroy
        flash[:notice] = "Konto użytkownika #{uzytkownik.imie} #{uzytkownik.nazwisko} zostało usunięte"
        redirect_to(:action => 'index')
    end

  	private
  		  def uzytkownik_parametry
  		      params.require(:uzytkownik).permit(:uzytkownik, :imie, :nazwisko, :email, :telefon)
  		  end
end
