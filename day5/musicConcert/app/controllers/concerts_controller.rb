class ConcertsController < ApplicationController

  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.new(concert_params)

    if (@concert.save)
      flash[:notice] = "Concert created successfully"
      redirect_to action: 'new', controller: 'concerts'
    else
      flash[:alert] = "Something's not right"
      render 'new'
    end
  end

  def index
    begin_today = Date.current.beginning_of_day
    finish_today = Date.current.end_of_day
    year = Date.current.year
    month = Date.current.month
    last_day_of_month = Date.new(year, month, -1).end_of_day

    @concerts_today = Concert.where(date: begin_today..finish_today)
    @concerts_rest_of_month = Concert.where(date: begin_today..last_day_of_month).order("date ASC")
  end

  def show

    @concert = Concert.find(params[:id])
    @comments = @concert.comments
    @comment = Comment.new
    
  end


  private 

  def concert_params
    params.require(:concert).permit(:band, :venue, :city, :date, :price, :description)
  end

end
