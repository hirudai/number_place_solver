module NumberPlaceSolver
  module Formatter
    class SimpleCui
      def initialize(puzzle)
        raise "puzzle must be PuzzleCells class" if puzzle.class.to_s != "NumberPlaceSolver::PuzzleCells"
        @puzzle = puzzle
        @output = build_output_str
      end

      def formated_puzzle_str
        @output = build_output_str
        @output
      end

      def print_puzzle
        @output = build_output_str
        print @output
      end

      private

      def bold_sepalator
        "#===+===+===#===+===+===#===+===+===#\n"
      end

      def normal_sepalator
        "#---+---+---#---+---+---#---+---+---#\n"
      end

      def num_sepalator(row)
        str = "# #{row[0].fix_num} | #{row[1].fix_num} | #{row[2].fix_num} "
        str = str.concat("# #{row[3].fix_num} | #{row[4].fix_num} | #{row[5].fix_num} ")
        str = str.concat("# #{row[6].fix_num} | #{row[7].fix_num} | #{row[8].fix_num} #\n")
        return str
      end

      def build_output_str
        str = ""
        str = str.concat(bold_sepalator)
        3.times do |i|
          3.times do |j|
            target_index = i * 3 + j
            str = str.concat(num_sepalator(@puzzle.rows[target_index].cells))
            if j < 2
              str = str.concat(normal_sepalator)
            else
              str = str.concat(bold_sepalator)
            end
          end
        end
        return str 
      end
    end
  end
end
