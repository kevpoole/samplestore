class Admin::LinksController < AdminController
  before_action :set_admin_link, only: %i[ show edit update destroy ]

  # GET /admin/links or /admin/links.json
  def index
    @admin_links = Link.all
  end

  # GET /admin/links/1 or /admin/links/1.json
  def show
  end

  # GET /admin/links/new
  def new
    @admin_link = Link.new
  end

  # GET /admin/links/1/edit
  def edit
  end

  # POST /admin/links or /admin/links.json
  def create
    @admin_link = Link.new(admin_link_params)

    respond_to do |format|
      if @admin_link.save
        format.html { redirect_to admin_links_path, notice: "Link was successfully created." }
        format.json { render :show, status: :created, location: @admin_link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/links/1 or /admin/links/1.json
  def update
    respond_to do |format|
      if @admin_link.update(admin_link_params)
        format.html { redirect_to admin_links_path, notice: "Link was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/links/1 or /admin/links/1.json
  def destroy
    @admin_link.destroy!

    respond_to do |format|
      format.html { redirect_to admin_links_path, status: :see_other, notice: "Link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_link
      @admin_link = Link.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def admin_link_params
      params.require(:link).permit(:name, :url)
    end
    
end
