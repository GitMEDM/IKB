class CenyPakietowsController < ApplicationController

  layout 'user'

    before_action :sprawdz_logowanie

  def index
    @biegs = Biegi.find(params[:bieg_id])
    @cenyPakietow = @biegs.ceny_pakietows.sortujData
  end
/----------------------------------------------------------------------------------------------------/
  def nowa
    @biegs = Biegi.find(params[:bieg_id])
    @cenaPakietu = CenyPakietow.new({:biegi_id => @biegs.id, :cena => "0.00"})
  	@waluta = ["CHF", "EUR", "GBR", "PLN", "USD"]
  	@bieg = Biegi.order('data ASC')
  end

  def utworz
    @biegs = Biegi.find(params[:bieg_id])
    @cenaPakietu = CenyPakietow.new(cenaPakietu_parametr)
    if @cenaPakietu.save
      flash[:notice] = "Cena została poprawnie dodana."
      redirect_to(:action => 'index', :bieg_id => @biegs.id)
    else
      @bieg = Biegi.order('data ASC')
      render('nowa')
    end
  end
/----------------------------------------------------------------------------------------------------/
  def edycja
    @biegs = Biegi.find(params[:bieg_id])
    @cenaPakietu = CenyPakietow.find(params[:id])
    @waluta = ["CHF", "EUR", "GBR", "PLN", "USD"]
    @bieg = Biegi.order('data ASC')
  end

  def aktualizuj
    @biegs = Biegi.find(params[:bieg_id])
    @cenaPakietu = CenyPakietow.find(params[:id])
    if @cenaPakietu.update_attributes(cenaPakietu_parametr)
      flash[:notice] = "Cena została poprawnie zmodyfikowana."
      redirect_to(:controller => 'biegis', :action => 'szczegoly', :id => @biegs.id)
    else
      @waluta = ["CHF", "EUR", "GBR", "PLN", "USD"]
      @bieg = Biegi.order('data ASC')
      render('edycja')
    end
  end
/----------------------------------------------------------------------------------------------------/
  def usun
    @biegs = Biegi.find(params[:bieg_id])
    @cenaPakietu = CenyPakietow.find(params[:id])
  end

  def kasuj
    @biegs = Biegi.find(params[:bieg_id])
    cenaPakietu = CenyPakietow.find(params[:id]).destroy
    flash[:notice] = "Cena został poprawnie usunięta."
    redirect_to(:controller => 'biegis', :action => 'szczegoly', :id => @biegs.id)
  end
/----------------------------------------------------------------------------------------------------/
  def cenaPakietu_parametr
    params.require(:cenaPakietu).permit(:data, :cena, :waluta, :biegi_id)
  end
end
