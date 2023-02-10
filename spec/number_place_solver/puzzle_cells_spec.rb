# encoding: utf-8
require 'spec_helper'

RSpec.describe NumberPlaceSolver::PuzzleCells do
  result_nums = "583964127296713548714582396621498735937125684458376912349257861872631459165849273".split("")
  let(:puzzle_cell){NumberPlaceSolver::PuzzleCells.new(result_nums)}

  describe "column organize test" do
    context "all column organize correct" do
      column_num_list = [
        [5,2,7,6,9,4,3,8,1],
        [8,9,1,2,3,5,4,7,6],
        [3,6,4,1,7,8,9,2,5],
        [9,7,5,4,1,3,2,6,8],
        [6,1,8,9,2,7,5,3,4],
        [4,3,2,8,5,6,7,1,9],
        [1,5,3,7,6,9,8,4,2],
        [2,4,9,3,8,1,6,5,7],
        [7,8,6,5,4,2,1,9,3],
      ]
      column_num_list.each_with_index do |column_nums, i|
        it "column #{i+1} correct" do
          fix_nums = puzzle_cell.columns[i].cells.map{|cell| cell.fix_num}
          expect(fix_nums.join("")).to eq(column_num_list[i].join(""))
        end
      end
    end
  end

  describe "row organize test" do
    context "all row organize correct" do
      row_num_list = [
        [5,8,3,9,6,4,1,2,7],
        [2,9,6,7,1,3,5,4,8],
        [7,1,4,5,8,2,3,9,6],
        [6,2,1,4,9,8,7,3,5],
        [9,3,7,1,2,5,6,8,4],
        [4,5,8,3,7,6,9,1,2],
        [3,4,9,2,5,7,8,6,1],
        [8,7,2,6,3,1,4,5,9],
        [1,6,5,8,4,9,2,7,3],
      ]
      row_num_list.each_with_index do |row_nums, i|
        it "row #{i+1} correct" do
          fix_nums = puzzle_cell.rows[i].cells.map{|cell| cell.fix_num}
          expect(fix_nums.join("")).to eq(row_num_list[i].join(""))
        end
      end
    end
  end

  describe "section organize test" do
    context "all section organize correct" do
      section_num_list = [
        [5,8,3,2,9,6,7,1,4],
        [9,6,4,7,1,3,5,8,2],
        [1,2,7,5,4,8,3,9,6],
        [6,2,1,9,3,7,4,5,8],
        [4,9,8,1,2,5,3,7,6],
        [7,3,5,6,8,4,9,1,2],
        [3,4,9,8,7,2,1,6,5],
        [2,5,7,6,3,1,8,4,9],
        [8,6,1,4,5,9,2,7,3],
      ]
      section_num_list.each_with_index do |section_nums, i|
        it "section #{i+1} correct" do
          fix_nums = puzzle_cell.sections[i].cells.map{|cell| cell.fix_num}
          expect(fix_nums.join("")).to eq(section_num_list[i].join(""))
        end
      end
    end
  end

end
