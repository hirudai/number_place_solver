require "spec_helper"

RSpec.describe NumberPlaceSolver::Cell do
  context "no args initialize" do
    let(:no_args_cell) { NumberPlaceSolver::Cell.new }
    it "fix_num expect 0" do
      expect(no_args_cell.fix_num).to eq(0)
    end

    it "candidate_nums class expect Array" do
      expect(no_args_cell.candidate_nums.class).to eq(Array)
    end

    it "candidate_nums count expect 9" do
      expect(no_args_cell.candidate_nums.count).to eq(9)
    end

    it "candidate_nums expect to include numbers from 1 to 9" do
      expect(no_args_cell.candidate_nums.sort).to eq((1..9).to_a.sort)
    end
  end

  context "only fix_num arg initialize" do
    test_fix_num = 1
    let(:fix_num_cell) { NumberPlaceSolver::Cell.new(test_fix_num) }

    it "fix_num expect to test_fix_num" do
      expect(fix_num_cell.fix_num).to eq(test_fix_num)
    end

    it "candidate_nums class expect Array" do
      expect(fix_num_cell.candidate_nums.class).to eq(Array)
    end

    it "candidate_nums count expect 0" do
      expect(fix_num_cell.candidate_nums.class).to eq(Array)
    end
  end

  context "exclude_canddate_nums" do
    let(:normal_cell) { NumberPlaceSolver::Cell.new }
    context "no operation due to illegal arg" do
      it "no array expect no change" do
        normal_cell.exclude_candidate_nums(1)
        expect(normal_cell.candidate_nums).to eq(normal_cell.candidate_nums)
      end

      it "no arg expect no change" do
        normal_cell.exclude_candidate_nums
        expect(normal_cell.candidate_nums).to eq(normal_cell.candidate_nums)
      end

      it "blank array no change" do
        normal_cell.exclude_candidate_nums([])
        expect(normal_cell.candidate_nums).to eq(normal_cell.candidate_nums)
      end
    end

    context "normal operation" do
      it "expect normal change" do
        normal_cell.exclude_candidate_nums([1, 2, 3])
        expect(normal_cell.candidate_nums).to eq([4, 5, 6, 7, 8, 9])
      end
    end
  end

  context "decide_fix_num" do
    test_fix_num = 1
    test_candidate_to_fix = [test_fix_num]
    test_candidate_no_fix = [test_fix_num, test_fix_num + 1]
    let(:normal_cell) { NumberPlaceSolver::Cell.new }
    it "becomes test_fix_num after decide to fix" do
      normal_cell.candidate_nums = test_candidate_to_fix
      normal_cell.decide_fix_num
      expect(normal_cell.fix_num).to eq(test_fix_num)
    end

    it "becomes blank array after decide to fix" do
      normal_cell.candidate_nums = test_candidate_to_fix
      normal_cell.decide_fix_num
      expect(normal_cell.candidate_nums).to eq([])
    end

    it "do nothing fix_num no change" do
      normal_cell.candidate_nums = test_candidate_no_fix
      normal_cell.decide_fix_num
      expect(normal_cell.fix_num).to eq(0)
    end

    it "do nothing candidate_nums no change" do
      normal_cell.candidate_nums = test_candidate_no_fix
      normal_cell.decide_fix_num
      expect(normal_cell.candidate_nums).to eq(test_candidate_no_fix)
    end
  end

  context "illegal num arg initialize" do
    let(:illegal_num_cell) { NumberPlaceSolver::Cell.new("a") }

    it "fix_num expect to 0" do
      expect(illegal_num_cell.fix_num).to eq(0)
    end

    it "candidate_nums expect to include numbers from 1 to 9" do
      expect(illegal_num_cell.candidate_nums).to eq((1..9).to_a.sort)
    end
  end

  context "illegal_candidate_cell initialize" do
    let(:illegal_candidate_cell) { NumberPlaceSolver::Cell.new(0, 123) }

    it "fix_num expect to 0" do
      expect(illegal_candidate_cell.fix_num).to eq(0)
    end

    it "candidate_nums expect to include numbers from 1 to 9" do
      expect(illegal_candidate_cell.candidate_nums).to eq((1..9).to_a.sort)
    end
  end

  context "contradiction num cell initialize" do
    let(:contradiction_num_cell) { NumberPlaceSolver::Cell.new(0, []) }
    it "fix_num expect to 0" do
      expect(contradiction_num_cell.fix_num).to eq(0)
    end

    it "candidate_nums expect to include numbers from 1 to 9" do
      expect(contradiction_num_cell.candidate_nums).to eq((1..9).to_a.sort)
    end
  end

  context "contradiction candidate cell initialize" do
    test_fix_num = 1
    let(:contradiction_candidate_cell) { NumberPlaceSolver::Cell.new(test_fix_num, [1, 2]) }
    it "fix_num expect to test_fix_num" do
      expect(contradiction_candidate_cell.fix_num).to eq(test_fix_num)
    end

    it "candidate_nums expect to blank" do
      expect(contradiction_candidate_cell.candidate_nums).to eq([])
    end
  end
end
