//
//  Path.swift
//  FindPathOfLowestCost
//
//  Created by neelam on 15/12/16.
//  Copyright © 2016 neelam. All rights reserved.
//

// This Class define the Path values (Row numbers , Total Cost and Length of the path) that is traversed
import Foundation

public class Path : NSObject {

    // Array for row numbers traversed
     public var rowsTraversed = Array<Int>()
    // Total sum of value at the row and column traversed
     public var totalCost = 0
    // Expected path length (Total number of colmun in the Matrix)
     public var expectedPathCount : Int
    
     init(expectedCount : Int) {
        self.expectedPathCount = expectedCount
    }
    
     init(anotherPath : Path) {
        self.totalCost = anotherPath.totalCost
        self.expectedPathCount = anotherPath.expectedPathCount
        for rowTraversed in anotherPath.rowsTraversed {
            self.rowsTraversed.append(rowTraversed)
        }
    }

}
