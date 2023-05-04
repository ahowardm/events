class CategoriesController < ApplicationController
    def new
        @category = Category.new
    end

    def index
        @categories = Category.all
    end

    def show
        @category = Category.find params[:id]
        @events = @category.events
    end

    def create
        @category = Category.new category_params
        if @category.save
            redirect_to @category, notice: 'Categoría creada con éxito'
        else
            redirect_to new_category_path, alert: 'No ha sido posible crear la categoría'
        end
    end

    private
        def category_params
            params.require(:category).permit(:name)
        end
end