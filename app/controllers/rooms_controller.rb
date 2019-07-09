class RoomsController < ApplicationController
  def room_list
    [{'id': 1, 'name': 'Room 1'}, {'id': 2, 'name': 'Room 2'}]
  end

  def index
    @rooms = Room.first(10)
  end

  def create
  end

  def update
    id = params[:id]
    @room = ::Room.find(id)
    unless @room.nil?
      @room.update(room_params)
      render :show
    else
      render :show, error: "Can not find room id: #{id}"
    end
  end

  def cell_click

  end

  def show
    @room = Room.find(params[:id])
    @room.turn ||= @room.user_1
    @board = generate_board 3
  end

  private 
  def room_params
    params.permit(:name, :user_1, :user_2, :turn)
  end

  def generate_board(size)
    row = Array.new(size) {|i| ''}
    (1..3).reduce([]) { |acc, _|
      acc.push(row)
    }
  end
end
