class Api::V1::StoresController < ApplicationController
  before_action :set_store, only: [:show]
  
  def show
  end
  
  # private - não pode ser acessado pela chamada web
  private 
  
  def set_store
    # variável de instancia - para ser acessado em outros métodos
    # é passado automaticamente para a view
    @store = Store.find_by!(google_place_id: params[:id])
  end
end
