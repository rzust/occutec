class Admin::CategoriesController < ApplicationController
  def update
    category = Category.find(params[:id])
    if category.update(params.require(:category).permit(:name, :description))
      flash[:success] = "Category updated!"
      redirect_to admin_path(category.id)
    else
      redirect_to admin_root_path
    end
  end
end
