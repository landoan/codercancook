class SectionsController < ApplicationController
  def index
    @section_types = Section.all

    if params[:sort_section]
      @active_section = params[:sort_section]
      @sections = Section.all.includes(:foods)
      #@sections = Section.where(name: params[:sort_section]).includes(:foods)

      if params[:sort_type]
        @sort_type = params[:sort_type]
      end
    else
      @active_section = ''
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
