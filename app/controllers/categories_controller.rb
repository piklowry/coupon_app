class CategoriesController < ApplicationController
	def index 
    @categories = Category.all
  end

  def new
    @new_category = Category.new
  end

  def create
    @new_category = Category.new(category_params)
    if @new_category.save
      redirect_to categories_path
    else
      redirect_to new_category_path
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to categories_path
    else
      redirect_to category_path
    end
  end

  def destroy
    @category = Category.find(params[:id])

    if @category.delete
      redirect_to categories_path
    end
  end

  def search
    
    @categories = Category.search(params[:search])
    # render search_categories_path
  end


  def results
    @search_results
  end




  private

  def category_params
    params.require(:category).permit!
  end 
end
end
