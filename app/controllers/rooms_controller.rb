class RoomsController < ApplicationController
  def room_list
    [{'id': 1, 'name': 'Room 1'}, {'id': 2, 'name': 'Room 2'}]
  end

  def index
    @rooms = room_list
  end

  def create
  end

  def show
    room = room_list.find{|r| r.id == params[:id]}
  end
end
