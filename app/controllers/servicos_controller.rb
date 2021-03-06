class ServicosController < ApplicationController
  before_action :require_logged_in_user
  before_action :set_servico, only: %i[ show edit update destroy ]

  # GET /servicos or /servicos.json
  def index
    @servicos = current_usuario.servicos
  end

  # GET /servicos/1 or /servicos/1.json
  def show
  end

  # GET /servicos/new
  def new
    @servico = Servico.new
  end

  # GET /servicos/1/edit
  def edit
  end

  # POST /servicos or /servicos.json
  def create
    @servico = current_usuario.servicos.build(servico_params)

    respond_to do |format|
      if @servico.save
        format.html { redirect_to @servico, notice: "Serviço foi criado com sucesso." }
        format.json { render :show, status: :created, location: @servico }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servicos/1 or /servicos/1.json
  def update
    respond_to do |format|
      if @servico.update(servico_params)
        format.html { redirect_to @servico, notice: "Serviço foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @servico }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servicos/1 or /servicos/1.json
  def destroy
    @servico.destroy
    respond_to do |format|
      format.html { redirect_to servicos_url, notice: "Serviço foi apagado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servico
      @servico = current_usuario.servicos.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def servico_params
      params.require(:servico).permit(:tipoDoServico, :descricao, :data, :valorDoServico, :statusDePagamento, :cliente_id, :ajudante_id, :material_id)
    end
end
