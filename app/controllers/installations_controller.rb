class InstallationsController < ApplicationController

  def index
    @installations = Installation.all.order(:name)
  end

  def show
    @installation = Installation.find(params[:id])
  end

  def new
    @installation = Installation.new
  end

  def create
    @installation = Installation.new(installation_params)

    respond_to do |format|
      if @installation.save
        format.html { redirect_to @installation, notice: 'installation was successfully created.' }
        format.json { render :show, status: :created, location: @installation }
      else
        format.html { render :new }
        format.json { render json: @installation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def installation_params
      params.require(:installation).permit(:name, :repo, :website, :contact_name, :conact_email, :location, :organization_type, :status, :notes)
    end

end
