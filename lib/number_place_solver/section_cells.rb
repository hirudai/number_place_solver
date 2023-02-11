module NumberPlaceSolver
  class SectionCells
    attr_accessor :cells

    def initialize(s_cells = [])
      raise "Definition of Cells is insufficient" if s_cells.count != 9

      @cells = s_cells
    end
  end
end
