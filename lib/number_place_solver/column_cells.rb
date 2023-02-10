module NumberPlaceSolver
  class ColumnCells
    attr_accessor :cells
    def initialize(c_cells=[])
      raise "Definition of Cells is insufficient" if c_cells.count != 9
      @cells = c_cells
    end
  end
end
