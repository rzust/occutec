class Admin::SectionsController < ApplicationController

  respond_to :json

  def index
    respond_with Section.where(page_id: params[:page_id]).to_a
  end

  def show
    respond_with Section.find(params[:id])
  end

  def create
    respond_with Section.create(params[:section])
  end

  def update
    respond_with Section.update(params[:id], params[:section].permit(:title, :body, :image))
  end

  def destroy
    respond_with Section.destroy(params[:id])
  end

  def update_sections
    params[:sections].each do |x|
      section = Section.find(x[1][:id])
      section.update(body: x[1][:body], image: x[1][:image])
    end   
    redirect_to :back and return
  end

end
