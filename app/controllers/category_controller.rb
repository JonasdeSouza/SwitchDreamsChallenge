class CategoryController < ApplicationController
  def index
  @categories = Category.all
  end

  def create
    category = Category.new(@categories_params)
    begin
      category.save!
      flash[:notice] = "Produto #{category.name} adicionado com sucesso!"
      redirect_to @categories_path
    rescue => exc
      puts exc
      flash[:notice] = exc
      redirect_to new_category_path
    end
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def show
    @category = Category.find(params[:id])
    @order = Order.new
  end

  def update
    category = Category.find(params[:id])
    begin
      category.update!(@categories_params)
      flash[:notice] = "Produto #{category.name} alterado com sucesso!"
      redirect_to @categories_path
    rescue => exc
      puts exc
      flash[:notice] = exc
      redirect_to edit_category_path
    end
  end

  def destroy
    category = Category.find(params[:id])
    begin
      category.destroy!
      flash[:notice] = "Produto #{category.name} deletado com sucesso!"
    rescue => exc
      puts exc
      flash[:notice] = exc
    ensure
      redirect_to @categories_path
    end
  end

  private

  def categories_params
    params.require('category').permit(:name)
  end
end
