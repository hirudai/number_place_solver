module NumberPlaceSolver
  class RowCells
    attr_accessor :cells
    def initialize(r_cells=[])
      raise "Definition of Cells is insufficient" if r_cells.count != 9
      @cells = r_cells
    end
  end
end
