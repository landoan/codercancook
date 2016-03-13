class SectionsController < ApplicationController
  def index
    @section_types = Section.all
    if params[:sort_section]

      @sections = Section.includes(:foods).find_by_name(params[:sort_section])
      if params[:sort_type]
        sort_type = params[:sort_type]
        if sort_type == 'aToz'

          @sections.foods.order('name')
        elsif sort_type == 'priceLow'
               @sections.foods.order('price')

        elsif sort_type == ('priceHigh')
                 @sections.foods.order('price DESC')

        end

      end

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
