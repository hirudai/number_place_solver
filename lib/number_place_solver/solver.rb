module NumberPlaceSolver
  class Solver
    def initialize(puzzle_cells)
      raise "puzzle must be PuzzleCells class" if puzzle_cells.class.to_s != "NumberPlaceSolver::PuzzleCells"

      @puzzle = puzzle_cells
      @solve_strategy = Strategy::Possibility.new(@puzzle)
    end

    def solve_puzzle
      loop do
        before_cells = @puzzle.one_line_cell_list
        @solve_strategy.solve_puzzle
        after_cells = @puzzle.one_line_cell_list
        break if before_cells == after_cells
      end
    end

    def switch_strategy; end
  end
end
