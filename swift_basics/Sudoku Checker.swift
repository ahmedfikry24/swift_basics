
import Foundation

class SudokuChecker {
    
    func isValidStructure(sudoku: [[String]]) -> Bool {
        return sudoku.count == sudoku[0].count && sudoku.count >= 9
    }
    
    
    
    func isRowsValid(sudoku: [[String]] ) -> Bool {
        var rowSet = Set<String>()
        var isValid = true
        
        sudoku.forEach{row in
            row.forEach {  number in
                if rowSet.contains(number) && number != "_"{
                  isValid = false
                    return
                } else{ rowSet.insert(number) }
            }
            rowSet.removeAll()
            if !isValid { return }
        }
        
        return isValid
    }
    
    func isColumnsValid(sudoku: [[String]] ) -> Bool {
        var columnSet = Set<String>()
        var currentColumnPosition = 0
        var isValid = true
        
        for _ in 1...sudoku.count {
            
            sudoku.forEach{ row in
                let currentValue = row[currentColumnPosition]
                
                if columnSet.contains(currentValue)  && currentValue != "_" {
                    isValid = false
                    return
                }else{columnSet.insert(currentValue)}
            }
            currentColumnPosition += 1
            columnSet.removeAll()
            if !isValid { break }
        }

        return isValid
    }
    
    
    
}




