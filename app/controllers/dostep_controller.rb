class DostepController < ApplicationController

    layout 'guest'

    before_action :sprawdz_logowanie, :except => [:index, :login, :logowanie, :logoutg, :registration, :utworz]

  	def index
  	end

  	def login
  	end

  	def logowanie
    		if params[:uzytkownik].present? && params[:haslo].present?
            admin_szukam = Uzytkownik.where(:uzytkownik => params[:uzytkownik]).first
            if admin_szukam
                admin_autoryzacja = admin_szukam.authenticate(params[:haslo])
          	end
        end

      	if admin_autoryzacja
    		    session[:uzytkownik_id] = admin_autoryzacja.id
    		    session[:uzytkownik] = admin_autoryzacja.uzytkownik
            session[:admin] = admin_autoryzacja.admin
    		    flash[:notice] = "Zostałeś poprawnie zalogowany."
            if session[:admin]
                redirect_to(:controller => 'admin')
            else
    		        redirect_to(:controller => 'user', :id => session[:uzytkownik_id])
            end
      	else
        		flash[:notice] = "Błąd: niepoprawna nazwa użytkownika lub hasło."
        		redirect_to(:action => 'login')
      	end

  	end

  	def logout
  	    session[:uzytkownik_id] = nil
  	    session[:uzytkownik] = nil
        session[:admin] = nil
  	    flash[:notice] = "Zostałeś wylogowany"
  	    redirect_to(:action => "login")
  	end

    def registration
        @uzytkownik = Uzytkownik.new
    end

    def utworz
        @uzytkownik = Uzytkownik.new(rejestracja_parametry)
        if @uzytkownik.save
            flash[:notice] = "Zostałeś zarejestrowany, możesz się zalogować"
            redirect_to(:action => 'login')
        else
            render('registration')
        end

    end

    private
        def rejestracja_parametry
            params.require(:rejestracja).permit(:uzytkownik, :imie, :nazwisko, :email, :telefon, :password, :password_confirmation)
        end
end
