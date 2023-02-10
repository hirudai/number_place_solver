module NumberPlaceSolver
  class Cell
    attr_accessor :fix_num, :candidate_nums
    def initialize(fix_num=0, candidate_nums=(1..9).to_a)
      fix_num = fix_num.to_s.to_i
      if fix_num == 0
        @candidate_nums = (1..9).to_a
      else
        @candidate_nums = []
      end
      @fix_num = fix_num
    end

    def exclude_candidate_nums(exclude_nums=[])
      return unless exclude_nums.class == Array
      @candidate_nums = @candidate_nums - exclude_nums
    end

    def decide_fix_num
      return unless @candidate_nums.count == 1
      @fix_num = @candidate_nums[0]
      @candidate_nums = []
    end
  end
end
