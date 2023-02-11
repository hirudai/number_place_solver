module NumberPlaceSolver
  class PuzzleCells
    attr_accessor :puzzle_cells, :rows, :columns, :sections

    def initialize(nums = [])
      nums.flatten!
      raise "Definition of Cells is insufficient" if nums.count != 9 * 9

      # puzzle_cells[row_index][column_index]
      @puzzle_cells = []
      9.times do |row_index|
        row_cells = []
        9.times do |column_index|
          num_target = row_index * 9 + column_index
          row_cells << Cell.new(nums[num_target])
        end
        @puzzle_cells << row_cells
      end
      row_organize
      column_organize
      section_organize
    end

    # for debug
    def print_puzzle
      @puzzle_cells.each do |r|
        puts r.map { |c| c.fix_num }.join("")
      end
    end

    def decide_fix_num
      9.times do |row_index|
        9.times do |column_index|
          @puzzle_cells[row_index][column_index].decide_fix_num
        end
      end
    end

    def one_line_cell_list
      check_cell_list = []
      9.times do |row_index|
        9.times do |column_index|
          check_cell_list << @puzzle_cells[row_index][column_index].fix_num
        end
      end
      check_cell_list.join("")
    end

    private

    def column_organize
      @columns = []
      9.times do |column_index|
        column = []
        9.times do |row_index|
          column << @puzzle_cells[row_index][column_index]
        end
        @columns << ColumnCells.new(column)
      end
    end

    def row_organize
      @rows = []
      9.times do |row_index|
        @rows << RowCells.new(@puzzle_cells[row_index])
      end
    end

    def section_organize
      @sections = []
      3.times do |row_index|
        3.times do |column_index|
          section = []
          9.times do |index|
            section_column_index = index % 3 + column_index * 3
            section_row_index = index / 3 + row_index * 3
            section << @puzzle_cells[section_row_index][section_column_index]
          end
          @sections << SectionCells.new(section)
        end
      end
    end
  end
end
