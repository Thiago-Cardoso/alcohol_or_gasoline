class HomeController < ApplicationController
  def index
  end

  def challenge
    @alcohol = params[:alcohol]
    @gasoline = params[:gasoline]
    if(@alcohol == "" && @gasoline == "")
      render json: {"value":  "vazio" }
    else 
      resultado = Float(@alcohol) / Float(@gasoline)
      @resultado = resultado.round(2)
      if @resultado > 0.70
        mensagem = "Gasolina"
        render json: {"value":  mensagem }
      else 
        mensagem = "Álcool"
          render json: {"value":  mensagem }
      end
    end
  end
end
