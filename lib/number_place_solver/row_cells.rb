module NumberPlaceSolver
  class RowCells
    attr_accessor :cells

    def initialize(r_cells = [])
      raise "Definition of Cells is insufficient" if r_cells.count != 9

      @cells = r_cells
    end

    def only_candidate_nums
      _candidate_nums = @cells.map { |cell| cell.candidate_nums }
      (1..9).select { |i| _candidate_nums.flatten.count(i) == 1 }
    end

    def fix_only_candidate_num_cell(candidate_num)
      to_fix_cell = cells.select { |cell| cell.candidate_nums.include?(candidate_num) }.first
      to_fix_cell.exclude_candidate_nums([1, 2, 3, 4, 5, 6, 7, 8, 9] - [candidate_num])
      to_fix_cell.decide_fix_num
    end
  end
end
