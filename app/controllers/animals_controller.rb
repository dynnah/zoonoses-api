class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :update, :destroy]
  before_action :set_cuidador

  # GET /animals
  def index
    @animal = @cuidador.animal

    render json: @animal.to_json(:only => [:id, :nome, :sexo, :raca, :idade, :peso, :cuidador_id])
  end

  # GET /animals/1
  def show
    @animal = @cuidador.animal
    render json: @animal
  end

  # POST /animals
  def create
    @animal = @cuidador.animal.build

    if @animal.save
      render json: @animal, status: :created, location: @animal
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /animals/1
  def update
    if @animal.update(animal_params)
      render json: @animal
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /animals/1
  def destroy
    @animal.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      # @animal = @cuidador.animal.find(params[:id])
      @animal = Animal.where(id: params[:d], cuidador: current_cuidador).take
    end

    def set_cuidador
      @cuidador = Cuidador.find(params[:cuidador_id])
    end

    # Only allow a trusted parameter "white list" through.
    def animal_params
      params.require(:animal).permit(:nome, :raca, :sexo, :idade, :peso, :cuidador_id)
    end
end
