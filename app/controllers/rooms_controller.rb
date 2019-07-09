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
    x = params[:x].to_i
    y = params[:y].to_i
    @room = ::Room.find(params[:id])
    unless @room.nil?
      board = JSON.parse @room.board
      unless (board[x][y].empty?)
        render :json => {error: "Cell [#{x}, #{y}] is reserved. Please click another vacant sport "}
      else
        # board[x][y] = @room.current_icon
        # @room.switch_turn
        @room.mark_cell(x, y)
        render :json => {room: @room, success: 'ok'}
      end
    else      
      render :json => {:success => false, error: "Unable to find room id: #{params[:id]}"}
    end
  end

  def show
    @room = Room.find(params[:id])
    @room.turn ||= @room.user_1
    if @room.board.blank?
      @room.board = generate_board 3
      @room.save
    end
    @board = JSON.parse(@room.board)
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
