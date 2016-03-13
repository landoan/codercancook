class SectionsController < ApplicationController
  def index
    if params[:section_name]
      @sections = Section.find_by_name(section_name).includes(:foods)
    else
      @sections = Section.all.includes(:foods)
    end
  end

  def show
    @section = Section.find(params[:id])
  end


  def food_by_section(section_id)
    @foods = Food.find(section_id)
  end


end
