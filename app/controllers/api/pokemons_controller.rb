class Api::PokemonsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_pokemon, only: [:show, :update, :destroy]

  # GET /api/pokemons
  def index
    @pokemons = Pokemon.all
    render json: @pokemons
  end

  # GET /api/pokemons/1
  def show
    render json: @pokemon
  end

  # POST /api/pokemons
  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      render json: @pokemon, status: :created
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/pokemons/1
  def update
    if @pokemon.update(pokemon_params)
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/pokemons/1
  def destroy
    @pokemon.destroy
    render json: { message: 'Oh non... Vous avez laissé échapper ce pokémon.' }, status: :ok
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :type_1, :type_2, :total, :hp, :attack, :defense, :sp_atk, :sp_def, :speed, :generation, :legendary)
  end
end
