class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_page, only: [ :show, :destroy ]

  def index
    @pagy, @pages = pagy(current_user.pages.order(created_at: :desc))
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def new
    @page = current_user.pages.new
  end

  def create
    @page = current_user.pages.new(page_params)
    if @page.save
      ScrapePageJob.perform_later(@page.id)
      redirect_to pages_path, notice: "Scrape queued"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @pagy, @links = pagy(@page.links.order(:created_at))
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_path, alert: "Page deleted." }
      format.turbo_stream
    end
  end

  private

  def page_params
    params.require(:page).permit(:url)
  end

  def set_page
    @page = current_user.pages.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to pages_path, alert: "Page not found."
  end
end
