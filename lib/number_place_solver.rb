# frozen_string_literal: true

require_relative "number_place_solver/version"
require_relative "number_place_solver/cell"
require_relative "number_place_solver/row_cells"
require_relative "number_place_solver/column_cells"
require_relative "number_place_solver/section_cells"
require_relative "number_place_solver/puzzle_cells"
require_relative "number_place_solver/solver"
require_relative "number_place_solver/strategy/possibility"
require_relative "number_place_solver/strategy/alliance"
require_relative "number_place_solver/formatter/simple_cui"


module NumberPlaceSolver
  class Error < StandardError; end
  # Your code goes here...
end
