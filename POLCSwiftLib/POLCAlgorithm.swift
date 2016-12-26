//
//  POLCAlgorothm.swift
//  FindPathOfLowestCost
//
//  Created by neelam on 20/12/16.
//  Copyright © 2016 neelam. All rights reserved.
//
// This Class define Logic for finding least cost path traversed in a given Matrix

import Foundation

public class POLCAlgorithm {
    
     var bestPath : Path = Path(expectedCount: 0)
    
    public init() {
        bestPath = Path(expectedCount: 0)
    }
 

    //MARK:- Login for finding for least cost path in the paths traversed
    public func findPathOfLowestCostIn(_ matrix : Matrix?) -> (String,Int,Array<Int>) {
        
        var result = ("No",bestPath.totalCost,bestPath.rowsTraversed)
        
        if let inputMatrix = matrix
        {
            // Looping for starting at any row
            for i in 1...inputMatrix.rows
            {
                let path = findBestPath(i,matrix: inputMatrix)
                compareWithBestPath(path)
            }
            // Path should cover all columns
            if bestPath.rowsTraversed.count == inputMatrix.columns
            {
                result.0 = "Yes"
            }
        }
        let finalResult = (result.0,bestPath.totalCost,bestPath.rowsTraversed)
        return finalResult
    }
    
    //MARK:- Comparing Paths
     func compareWithBestPath(_ path : Path){
        
        if bestPath.rowsTraversed.count == 0
        {
            bestPath = path
        }
        else if path.rowsTraversed.count > bestPath.rowsTraversed.count
        {
            bestPath = path
        }
        else if path.rowsTraversed.count == bestPath.rowsTraversed.count
        {
            if path.totalCost < bestPath.totalCost
            {
                bestPath = path
            }
        }
    }
    
    //Traverse at start of each row
     func findBestPath(_ row : Int,matrix : Matrix?) -> Path {
        
        let initialPath = Path(expectedCount: matrix!.columns)
        getPath(row,path: initialPath, matrix: matrix)
        return bestPath
    }
    
    //Recursive logic to get least cost Path Traversed
     func getPath(_ row : Int, path : Path, matrix : Matrix?)
    {
        // Check if we can traverse fusther on matrix or not.
        if canTraverse(row, path: path, matrix: matrix)
        {
            // Moving one forward to Path and updating total cost till traversed path
            updateRowOnPath(row, path: path, matrix: matrix)
        }
        var isCurrentPathAdded = false;
        
        // Adjacent Rows
        var previousRow = row - 1
        var nextRow = row + 1
        if previousRow == 0
        {
            previousRow = matrix!.rows
        }
        if nextRow == matrix!.rows + 1
        {
            nextRow = 1
        }
        
        // Traversing thorugh adjacent rows
        for i in [previousRow , row , nextRow]
        {
            if canTraverse(i, path: path, matrix: matrix)
            {
                let newPath = Path(anotherPath: path)
                getPath(i, path: newPath, matrix: matrix)
            }
            else if isCurrentPathAdded == false
            {
                compareWithBestPath(path)
                isCurrentPathAdded = true
            }
        }
    }
    
    // Moving one forward to Path and updating total cost till traversed path
     func updateRowOnPath(_ row : Int, path : Path, matrix : Matrix?) {
        // next visit
        let columnToVisit = path.rowsTraversed.count + 1;
        //Add path visited to track
        path.rowsTraversed.append(row)
        // update the total cost till the point traversed in the matrix
        path.totalCost += matrix![row-1,columnToVisit-1]
    }
    
    //Check if traversing reached at end point of matrix or not
     func canTraverse(_ row : Int , path : Path, matrix : Matrix?) -> Bool {
        
        let nextColumn = path.rowsTraversed.count + 1;
        
        if (path.rowsTraversed.count != path.expectedPathCount) && ((path.totalCost + matrix![row - 1, nextColumn - 1]) < 50)
        {
            return true
        }
        return false
    }

}
