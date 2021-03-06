class ClientesController < ApplicationController
  before_action :require_logged_in_user
  before_action :set_cliente, only: %i[ show edit update destroy ]

  # GET /clientes or /clientes.json
  def index
    @clientes = current_usuario.clientes
  end

  # GET /clientes/1 or /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
    @cliente.build_endereco
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes or /clientes.json
  def create
    @cliente = current_usuario.clientes.build(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: "Cliente foi criado com sucesso." }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1 or /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: "Cliente foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1 or /clientes/1.json
  def destroy
    respond_to do |format|
    if @cliente.destroy
      format.html { redirect_to clientes_url, notice: "Cliente foi apagado com sucesso." }
      format.json { head :no_content }
    else
      format.html { redirect_to clientes_url, notice: "Cliente não pode ser apagado pois está em um ou mais Serviços" }
    end
  end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = current_usuario.clientes.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cliente_params
      params.require(:cliente).permit(:nome, :cpf, :contato, {:endereco_attributes => [:id, :cidade, :bairro, :logradouro, :complemento]}, :usuario_id)
    end
end
