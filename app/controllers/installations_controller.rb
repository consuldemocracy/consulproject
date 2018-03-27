class InstallationsController < ApplicationController

  def index
    @installations = Installation.all.order(:name)
  end

  def show
    @installation = Installation.find(params[:id])
  end

end