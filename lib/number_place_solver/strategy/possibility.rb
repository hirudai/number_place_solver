module NumberPlaceSolver
  module Strategy
    #------------------
    # Delete the candidate number from the fixed number and fix the number
    # -----------------
    class Possibility
      def initialize(puzzle_cells)
        raise "puzzle must be PuzzleCells class" if puzzle_cells.class.to_s != "NumberPlaceSolver::PuzzleCells"

        @puzzle = puzzle_cells
      end

      def solve_once
        @puzzle.rows.each { |row| exclude_candidate_nums(row.cells) }
        @puzzle.columns.each { |column| exclude_candidate_nums(column.cells) }
        @puzzle.sections.each { |section| exclude_candidate_nums(section.cells) }
        @puzzle.decide_fix_num
      end

      def solve_specified_times(num = 1)
        num.to_i.times do |_i|
          solve_once
        end
      end

      def solve_until_end
        loop do
          before_cells = @puzzle.one_line_cell_list
          solve_once
          after_cells = @puzzle.one_line_cell_list
          break if before_cells == after_cells
        end
      end

      def exclude_candidate_nums(cells)
        fix_nums = cells.map { |cell| cell.fix_num if cell.fix_num != 0 }.compact
        cells.each { |cell| cell.exclude_candidate_nums(fix_nums) }
      end
    end
  end
end
