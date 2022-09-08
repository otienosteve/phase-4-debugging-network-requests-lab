class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    # byebug 
    toy = Toy.create(toy_params)
    render json: toy, status: :created
  end

  def update
    toy = Toy.find_by(id: params[:id])
    if toy
    toy.update(toy_params)
    render json: toy, status: :accepted 
    else
      render json: {error:"error processing request"}
    end
    
    
  end

  def destroy
    toy = Toy.find_by(id: params[:id])
    if toy
    toy.destroy
    head :no_content
    else
    render json: {error:"toy not found"}
    end
  end

  private
  
  def toy_params
    params.permit(:name,:image,:likes)
  end

end
