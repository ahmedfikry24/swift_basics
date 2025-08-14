
import Foundation

class SudokuChecker {
    
    private let validNumbers = ["_","1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    func isSubgridsValid(sudoku: [[String]] ) -> Bool {
        var isValid = true
        let subgridCount = 3
        
        for _ in 1...subgridCount {
            var currentStage = 0
            
            let currentRows = sudoku.dropFirst(currentStage).prefix(subgridCount)
            
            for _ in 1...subgridCount{
            
                var currentRowStage = 0
                
                var subgrid = Array<[String]>()
                currentRows.forEach { row in
                    let rows = Array(row.dropFirst(currentRowStage).prefix(subgridCount))
                    subgrid.append(rows)
                }
                
               var sudgridValues = currentRows.flatMap{ $0 }
                Set(sudgridValues).count == 9 ? () : (isValid = false)
               sudgridValues.removeAll()
                
                if !isValid { break }
                currentRowStage += 3
            }
            
            if !isValid { break }
            currentStage += 3
        }
        
        return isValid
    }
    
    
    
    
    func isValidStructure(sudoku: [[String]]) -> Bool {
        return sudoku.count == sudoku[0].count && sudoku.count == 9
    }
    
    
    func isRowsValid(sudoku: [[String]] ) -> Bool {
        var rowSet = Set<String>()
        var isValid = true
        
        sudoku.forEach{row in
            row.forEach {
                let number = $0.trimmingCharacters(in: .whitespacesAndNewlines)
                if rowSet.contains(number) && number != "_" || !isValidNumber(number: number){
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
                let currentValue = row[currentColumnPosition].trimmingCharacters(in: .whitespacesAndNewlines)
                
                if columnSet.contains(currentValue)  && currentValue != "_" || !isValidNumber(number: currentValue) {
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
    
    private func isValidNumber(number: String) -> Bool {
        return validNumbers.contains(number)
    }
    
}




