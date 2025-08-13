
import Foundation

let sudokuChecker = SudokuChecker()

let sudoku = [
    ["1","3","_" ,"_","2","5","_" ,"_","7"],
    ["6","2","_" ,"_","9","7","_" ,"_","8"],
    ["2","1","_" ,"_","3","6","_" ,"_","5"],
    ["8","4","_" ,"_","6","4","_" ,"_","2"],
    ["9","5","_" ,"_","8","2","_" ,"_","6"],
    ["4","6","_" ,"_","5","3","_" ,"_","1"],
    ["7","8","_" ,"_","4","1","_" ,"_","9"],
    ["3","9","_" ,"_","7","8","_" ,"_","4"],
    ["5","7","_" ,"_","1","9","_" ,"_","3"],
]



print("this sudoku structure is \(sudokuChecker.isValidStructure(sudoku: sudoku) ? "valid" : "invalid")")
print("this sudoku rows is \(sudokuChecker.isRowsValid(sudoku: sudoku) ? "valid" : "invalid")")
print("this sudoku columns is \(sudokuChecker.isColumnsValid(sudoku: sudoku) ? "valid" : "invalid")")
