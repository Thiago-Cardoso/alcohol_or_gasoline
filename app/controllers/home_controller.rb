class HomeController < ApplicationController
  def index
  end

  def challenge
    @alcohol = params[:alcohol]
    @gasoline = params[:gasoline]
    resultado = Float(@alcohol) / Float(@gasoline)
    @resultado = resultado.round(2)
    if @resultado > 0.70
      mensagem = "G"
      render json: {"value":  mensagem }
    else 
      mensagem = "A"
        render json: {"value":  mensagem }
    end
  end
end
