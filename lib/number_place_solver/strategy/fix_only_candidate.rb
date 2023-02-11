module NumberPlaceSolver
  module Strategy
    class FixOnlyCandidate
      def initialize(puzzle_cells)
        raise "puzzle must be PuzzleCells class" if puzzle_cells.class.to_s != "NumberPlaceSolver::PuzzleCells"

        @puzzle = puzzle_cells
        @po_solver = NumberPlaceSolver::Strategy::Possibility.new(@puzzle)
      end

      def solve_once
        solve_row
        solve_col
        solve_sec
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

      def only_candidate_nums(cells)
        _candidate_nums = cells.map { |cell| cell.candidate_nums }
        (1..9).select { |i| _candidate_nums.flatten.count(i) == 1 }
      end

      def fix_only_candidate_num_cell(cells, candidate_num)
        to_fix_cell = cells.select { |cell| cell.candidate_nums.include?(candidate_num) }.first
        return if to_fix_cell.nil?

        to_fix_cell.exclude_candidate_nums([1, 2, 3, 4, 5, 6, 7, 8, 9] - [candidate_num])
        to_fix_cell.decide_fix_num
      end

      def solve_row
        @puzzle.rows.each do |row|
          only_candidate_nums(row.cells).each do |c_num|
            fix_only_candidate_num_cell(row.cells, c_num)
          end
        end
        @po_solver.solve_until_end
      end

      def solve_col
        @puzzle.columns.each do |col|
          only_candidate_nums(col.cells).each do |c_num|
            fix_only_candidate_num_cell(col.cells, c_num)
          end
        end
        @po_solver.solve_until_end
      end

      def solve_sec
        @puzzle.sections.each do |sec|
          only_candidate_nums(sec.cells).each do |c_num|
            fix_only_candidate_num_cell(sec.cells, c_num)
          end
        end
        @po_solver.solve_until_end
      end
    end
  end
end
