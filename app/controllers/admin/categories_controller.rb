class Admin::CategoriesController < AdminController
  before_action :set_admin_category, only: %i[ show edit update destroy ]

  # GET /admin/categories or /admin/categories.json
  def index
    @admin_categories = Category.all
  end

  # GET /admin/categories/1 or /admin/categories/1.json
  def show
    @category = Category.find(params[:id])
  end

  # GET /admin/categories/new
  def new
    @admin_category = Category.new
  end

  # GET /admin/categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /admin/categories or /admin/categories.json
  def create
    @admin_category = Category.new(admin_category_params)

    respond_to do |format|
      if @admin_category.save
        format.html { redirect_to admin_categories_path, notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @admin_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  
  end

  # PATCH/PUT /admin/categories/1 or /admin/categories/1.json
  def update
    respond_to do |format|
      if @admin_category.update(admin_category_params)
        format.html { redirect_to admin_categories_path, notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/categories/1 or /admin/categories/1.json
  def destroy
    @admin_category.destroy!

    respond_to do |format|
      format.html { redirect_to admin_categories_path, status: :see_other, notice: "Category was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_category
      @admin_category = Category.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def admin_category_params
      params.expect(category: [ :name, :description , :image])
    end

    def database_connected?
      # This tries to check the connection using an ActiveRecord query
      ActiveRecord::Base.connection.active?
    rescue ActiveRecord::ConnectionNotEstablished, PG::ConnectionBad => e
      # Log the error if connection is not established
      Rails.logger.error("Database connection error: #{e.message}")
      false
    end
end
