class Api::V1::StoresController < ApplicationController
  before_action :set_store, only: [:show]
  
  def index
    @stores = Store.within(params[:longitude].to_f, params[:latitude].to_f, 5000)
      .sort_by { |store| store.ratings_average }
      .reverse
  end
  
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
