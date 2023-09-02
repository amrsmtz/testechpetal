class PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.paginate(page: params[:page], per_page: 100)
  end
end
