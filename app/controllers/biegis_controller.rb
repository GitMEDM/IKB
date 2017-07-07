class BiegisController < ApplicationController
  
    layout 'user'

    before_action :sprawdz_logowanie

  def index
      @uzytkownik = Uzytkownik.find(params[:uzytkownik_id])
      @biegi = @uzytkownik.biegis.sortujData
      #@biegi = Biegi.sortujData
  end

  def szczegoly
    @bieg = Biegi.find(params[:id])
    @cenyPakietow = @bieg.ceny_pakietows.sortujData
  end

  def nowa
    @jednostkaMiary = ["km", "m"]
    @uzytkownik = Uzytkownik.find(params[:uzytkownik_id])
    @bieg = Biegi.new({:uzytkownik_id => @uzytkownik.id})
    #@bieg = Biegi.order('data ASC')
  end

  def utworz
    @uzytkownik = Uzytkownik.find(params[:uzytkownik_id])
    @bieg = Biegi.new(biegi_parametry)
    if @bieg.save
      flash[:notice] = "Bieg został poprawnie dodany."
      redirect_to(:action => 'index', :uzytkownik_id => @uzytkownik.id)
    else
      render('nowa')
    end
  end

  def edycja
    @bieg = Biegi.find(params[:id])
    @jednostkaMiary = ["km", "m"]
  end

  def aktualizuj
    @bieg = Biegi.find(params[:id])
    if @bieg.update_attributes(biegi_parametry)
      flash[:notice] = "Bieg został poprawnie zmodyfikowany."
      redirect_to(:action => 'szczegoly', :id => @bieg.id)
    else
      @jednostkaMiary = ["km", "m"]
      render('edycja')
    end
  end

  def usun
    @bieg = Biegi.find(params[:id])
  end

  def kasuj
    biegi = Biegi.find(params[:id]).destroy
    flash[:notice] = "Bieg został poprawnie usunięty."
    redirect_to(:action => 'index')
  end

  def biegi_parametry
    params.require(:bieg).permit(:uzytkownik_id, :data, :nazwa, :miejscowosc, :dystans, :jednostkaMiary)
  end
end
