class IngredientsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @ingredient = Ingredient.new(ingredient_params)
    unless @ingredient.save
      render_error
    end
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    unless @ingredient.update(ingredient_params)
      render_error
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    head :no_content
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name, :product_id)
  end

  def render_error
    render json: { errors: @ingredient.errors.full_messages },
      status: :unprocessable_entity
  end
end
