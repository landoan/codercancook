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

  def view_food_more_info
    food = Food.find_by_id(params[:food_id])
    food.view_no ||= 0
    current_no = food.view_no + 1
    food.update_attribute("view_no", current_no)
    if food.save
      respond_to do |format|
        format.html { redirect_to sections_path }
        format.json { head :no_content }
        format.js   { render :layout => false }
      end
    end

  end

  def food_by_section(section_id)
    @foods = Food.find(section_id)
  end


end
