class AjudantesController < ApplicationController
  before_action :require_logged_in_user
  before_action :set_ajudante, only: %i[ show edit update destroy ]

  # GET /ajudantes or /ajudantes.json
  def index
    @ajudantes = current_usuario.ajudantes
  end

  # GET /ajudantes/1 or /ajudantes/1.json
  def show
  end

  # GET /ajudantes/new
  def new
    @ajudante = Ajudante.new
  end

  # GET /ajudantes/1/edit
  def edit
  end

  # POST /ajudantes or /ajudantes.json
  def create
    @ajudante = current_usuario.ajudantes.build(ajudante_params)

    respond_to do |format|
      if @ajudante.save
        format.html { redirect_to @ajudante, notice: "Ajudante foi criado com sucesso." }
        format.json { render :show, status: :created, location: @ajudante }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ajudante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ajudantes/1 or /ajudantes/1.json
  def update
    respond_to do |format|
      if @ajudante.update(ajudante_params)
        format.html { redirect_to @ajudante, notice: "Ajudante foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @ajudante }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ajudante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ajudantes/1 or /ajudantes/1.json
  def destroy
    @ajudante.destroy
    respond_to do |format|
      format.html { redirect_to ajudantes_url, notice: "Ajudante foi apagado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ajudante
      @ajudante = current_usuario.ajudantes.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ajudante_params
      params.require(:ajudante).permit(:nome, :cpf, :contato, :precoMaoDeObra, :usuario_id)
    end
end
