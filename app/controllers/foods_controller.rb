class FoodsController < ApplicationController
  def new
    @food = Food.new
    @sections = Section.all

    respond_to do |format|
      format.html
      format.json {render json: @food }
    end
  end



  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to sections_path
    else
      respond_to do |format|
        format.html {render action: "new"}
        format.json {render json: @food.errors.full_messages, status: :unprocessable_entity}
      end
    end

  end

  def food_params
    params.require(:food).permit(:name, :description, :price, :picture, :section_id)
  end
end
