class CategoriesController < ApplicationController

  load_and_authorize_resource

  respond_to :html, :json

  def create
    @category = Category.new(category_params)
    
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path(@category), notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(
        :name
    )
  end

end
