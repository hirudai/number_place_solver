module NumberPlaceSolver
  module Strategy
    class Alliance
      def initialize(puzzle_cells)
        raise "puzzle must be PuzzleCells class" if puzzle_cells.class.to_s != "NumberPlaceSolver::PuzzleCells"

        @puzzle = puzzle_cells
      end

      def solve_puzzle
        @puzzle.rows.each { |row| exclude_candidate_nums(row.cells) }
        @puzzle.columns.each { |column| exclude_candidate_nums(column.cells) }
        @puzzle.sections.each { |section| exclude_candidate_nums(section.cells) }
        @puzzle.decide_fix_num
      end

      def exclude_candidate_nums(cells)
        # N国道名
        # 未確定セルの数-1をNとする
        # 未確定セル数-1を求める
        unknown_cells(cells).each_with_index do |cell, _i|
          current_candidate_count = cell.candidate_nums.count
        end
        # 処理対象セルの位置をマーキングしておかないとだめ
        cells.each_with_index do |cell, i|
        end
      end

      private

      def unknown_cells(cells)
        unknown_cells = cells.select { |cell| cell.fix_num == 0 && cell.candidate_nums.count > 1 }
      end
    end
  end
end
