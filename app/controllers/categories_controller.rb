class CategoriesController < ApplicationController
    before_action :load_shared
    before_action :load_category, only: :create
    load_and_authorize_resource

    # GET /categories
    # GET /categories.json
    def index
        if cannot? :manage, @categories
            flash[:error] = 'You do not have permission to view the category list.'
            redirect_to root_path
        end
    end

    def search
        @categories = @categories.select("id, name, html_class").where("name like ?", "%#{params[:q]}%").order(:name)
    end

    # GET /categories/1
    # GET /categories/1.json
    def show
    end

    # GET /categories/new
    def new
    end

    # GET /categories/1/edit
    def edit
    end

    # POST /categories
    # POST /categories.json
    def create
        respond_to do |format|
            if @category.save
                format.html { redirect_to @category, notice: 'Category was successfully created.' }
                format.json { render action: 'show', status: :created, location: @category }
            else
                format.html { render action: 'new' }
                format.json { render json: @category.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /categories/1
    # PATCH/PUT /categories/1.json
    def update
        respond_to do |format|
            if @category.update(category_params)
                format.html { redirect_to @category, notice: 'Category was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: 'edit' }
                format.json { render json: @category.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /categories/1
    # DELETE /categories/1.json
    def destroy
        @category.destroy
        respond_to do |format|
            format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
        # Only allow a trusted parameter "white list" through.
        def category_params
            params.require(:category).permit(:name, :html_class)
        end

        def load_shared
            @posts_by_year = Post.by_year
            @posts_by_month = Post.by_month
            @all_categories = Category.all
        end

        def load_category
            @category = Category.new(category_params)
        end
end
