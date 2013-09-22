class Board

  # @grid:
  # +---+---+---+---+---+
  # | 0 | 1 | 2 | 3 | 4 |
  # +---+---+---+---+---+
  # | 5 | 6 | 7 | 8 | 9 |
  # +---+---+---+---+---+
  # | 10| 11| 12| 13| 14|
  # +---+---+---+---+---+
  # | 15| 16| 17| 18| 19|
  # +---+---+---+---+---+
  # | 20| 21| 22| 23| 24|
  # +---+---+---+---+---+

  attr_reader :grid

  def initialize
    # -1 for unset squares
    @grid = Array.new(25, -1)
  end

  # returns false if illegal move
  # and player id if it is legal
  def move(square, player)
    # check if square is taken
    if not @grid[square] == -1
      return false
    end
    @grid[square] = player
  end

  # resets the grid
  def reset
    @grid.replace(Array.new(25, -1))
  end

  # returns the id of the winner
  # -1 for stalemate or false if
  # game is not over
  def game_over?
    for i in 0..4
      if self.horizonal?(i)
        return @grid[5*i]
      elsif self.vertical?(i)
        return @grid[i]
      end
    end

    if self.diagonal_right?(i)
      return @grid[0]
    elsif self.diagonal_left?(i)
      return @grid[4]
    end

    if not @grid.include?(-1)
      return -1
    end

    false
  end

  def horizonal?(i)
    return @grid[5*i] != -1 && @grid[5*i] == @grid[5*i + 1] && @grid[5*i + 1] == @grid[5*i + 2] &&
      @grid[5*i + 2] == @grid[5*i + 3] && @grid[5*i + 3] == @grid[5*i + 4]
  end

  def vertical?(i)
    return @grid[i] != -1 && @grid[i] == @grid[i + 5] && @grid[i + 5] == @grid[i + 10] &&
      @grid[i + 10] == @grid[i + 15] && @grid[i + 15] == @grid[i + 20]
  end

  def diagonal_right?(i)
    return @grid[0] != -1 && @grid[0] == @grid[6] && @grid[6] == @grid[12] &&
      @grid[12] == @grid[18] && @grid[18] == @grid[24]
  end

  def diagonal_left?(i)
    return @grid[4] != -1 && @grid[4] == @grid[8] && @grid[8] == @grid[12] &&
      @grid[12] == @grid[16] && @grid[16] == @grid[20]
  end
end
