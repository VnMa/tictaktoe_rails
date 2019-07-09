class Room < ApplicationRecord
    
    def current_icon
        return (self.user_1 == self.turn) ? 'x' : 'o'
    end

    def mark_cell(x,y)
        board  = JSON.parse self.board
        board[x][y] = current_icon
        next_turn = (self.user_1 == self.turn) ? self.user_2 : self.user_1
        self.update(board: board, turn: next_turn)
    end

    def switch_turn
        self.turn = (self.user_1 == self.turn) ? self.user_2 : self.user_1
        self.save
    end
end
