class Admin::ShowsController < AdminController
  before_action :set_admin_show, only: %i[ show edit update destroy ]

  # GET /admin/shows or /admin/shows.json
  def index
    @admin_shows = Show.all
  end

  # GET /admin/shows/1 or /admin/shows/1.json
  def show
    @admin_shows = Show.find(params[:id])
  end

  # GET /admin/shows/new
  def new
    @admin_show = Show.new
  end

  # GET /admin/shows/1/edit
  def edit
    @admin_show = Show.find(params[:id])
  end

  # POST /admin/shows or /admin/shows.json
  def create
    @admin_show = Show.new(admin_show_params)

    respond_to do |format|
      if @admin_show.save
        format.html { redirect_to admin_shows_path, notice: "Show was successfully created." }
        format.json { render :show, status: :created, location: @admin_show }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/shows/1 or /admin/shows/1.json
  def update
    respond_to do |format|
      if @admin_show.update(admin_show_params)
        format.html { redirect_to admin_shows_path, notice: "Show was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_show }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/shows/1 or /admin/shows/1.json
  def destroy
    @admin_show.destroy!

    respond_to do |format|
      format.html { redirect_to admin_shows_path, status: :see_other, notice: "Show was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_show
      @admin_show = Show.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def admin_show_params
      params.require(:show).permit(:venue, :date, :description, :image)
    end
end
