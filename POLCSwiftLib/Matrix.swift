//
//  InputMatrix.swift
//  FindPathOfLowestCost
//
//  Created by neelam on 15/12/16.
//  Copyright © 2016 neelam. All rights reserved.
//

// This Structure define Matrix definition

import Foundation

public struct Matrix {
    
     let rows: Int, columns: Int
     var grid: [Int]
    
    //MARK:- Constructor Matrix From hard code Row and Column
    public init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0, count: rows * columns)
    }
    
     func indexIsValid(_ row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
     public subscript(row: Int, column: Int) -> Int {
        get {
            assert(indexIsValid(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
    
    //MARK:- Constructor Matrix From String
    public init?(input : String){
        
        if input == ""
        { return nil }
        
        let rows = input.components(separatedBy: "\n")
        let numberOfRows = rows.count
        let digitsArray = rows[0].components(separatedBy: ",")
        let numberOfColumns = digitsArray.count
        
        var matrix = Matrix(rows: numberOfRows, columns: numberOfColumns)
        
        for i in 0..<rows.count
        {
            let digitsArray = rows[i].components(separatedBy: ",")
            for j in 0..<digitsArray.count
            {
                let value = digitsArray[j].trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

                if let num = Int(value)
                {
                    if j > numberOfColumns - 1
                    {
                        return nil
                    }
                    
                    matrix[i,j] = num
                }
                else
                {
                    return nil
                }
            }
        }
        self.rows = matrix.rows
        self.columns = matrix.columns
        self.grid = matrix.grid
        
    }

}
