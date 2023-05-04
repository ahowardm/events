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

    def edit
        @category = Category.find params[:id]
    end

    def create
        @category = Category.new category_params
        if @category.save
            redirect_to @category, notice: 'Categoría creada con éxito'
        else
            render 'new'
        end
    end

    def update
        @category = Category.find params[:id]
        if @category.update category_params
            redirect_to @category, notice: 'Categoría actualizada con éxito'
        else
            render 'edit'
        end
    end

    def destroy
        @category = Category.find params[:id]
        @category.destroy
        redirect_to categories_path
    end

    private
        def category_params
            params.require(:category).permit(:name)
        end
end