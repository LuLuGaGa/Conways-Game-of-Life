//
//  Universe.m
//  ConwaysGameOfLIfe
//
//  Created by Lucyna Galik on 20/02/2017.
//  Copyright © 2017 Lucyna Galik. All rights reserved.
//

#import "Universe.h"


@implementation Universe

// RULES
// 1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
// 2. Any live cell with two or three live neighbours lives on to the next generation.
// 3. Any live cell with more than three live neighbours dies, as if by overpopulation.
// 4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.




- (id) initWithNumberOfRows: (int) numberOfRows andCollumns: (int) numberOfColumns {
    self = [super init];
    self.numberOfRows = numberOfRows;
    self.numberOfColumns = numberOfColumns;
    
    NSMutableArray *universe = [[NSMutableArray alloc] initWithCapacity: numberOfRows];
    NSMutableArray *row = [[NSMutableArray alloc] initWithCapacity: numberOfColumns];
    NSMutableArray *nextGeneration = [[NSMutableArray alloc] initWithCapacity: numberOfRows];
    
    
    // create 2D arrays for universe and nextGeneration
    for (int i = numberOfRows; i > 0; i--) {
        [universe addObject: [row mutableCopy]];
        [nextGeneration addObject: [row mutableCopy]];
    }
    
    // populate universe with random 0 and 1
    for (int r = 0; r < numberOfRows; r++){
        for (int c =0; c < numberOfColumns; c++) {
            universe[r][c] = [NSNumber numberWithInteger: arc4random_uniform(2)];
        }
    }
    
    self.universe = universe;
    self.nextGeneration = nextGeneration;
    NSLog(@"Built new universe %@", universe);
    return self;
}

// return int value of any point in wrapped universe
- (int) getValueOfPointAtRow: (int) row andCollumn: (int) column {
    int r = (row + self.numberOfRows) % self.numberOfRows;
    int c = (column + self.numberOfColumns) % self.numberOfColumns;
    return [self.universe[r][c] intValue];
}


//check how many cells around are alive
- (int) sumOfNeighboursAtRow: (int) rowIndex atCollumn: (int) collumnIndex {
    int count = 0;
    for (int r = rowIndex - 1; r <= rowIndex +1; r++) {
        for (int c = collumnIndex - 1; c <= collumnIndex +1; c++) {
            
            if (!(r == rowIndex && c== collumnIndex)) {
                count += [self getValueOfPointAtRow: r andCollumn: c];
            }
        }
    }
    return count;
}

- (void) moveToNextGeneration {
    for (int r = 0; r < self.numberOfRows; r++){

        for (int c =0; c < self.numberOfColumns; c++) {
            // for dead cell
             if ([self getValueOfPointAtRow:r andCollumn:c] == 0) {
                if ([self sumOfNeighboursAtRow:r atCollumn:c] == 3) {
                    //come to life
                    self.nextGeneration[r][c] = [NSNumber numberWithInteger:1];
                } else {
                    //stay dead
                    self.nextGeneration[r][c] = [NSNumber numberWithInteger:0];
                }
            // for a live cell
            } else {
                if ([self sumOfNeighboursAtRow:r atCollumn:c] == 3 || [self sumOfNeighboursAtRow:r atCollumn:c] == 2) {
                    //survive
                    self.nextGeneration[r][c] = [NSNumber numberWithInteger:1];
                } else {
                    //die
                    self.nextGeneration[r][c] = [NSNumber numberWithInteger:0];
                }
            }
        }
    }
    //update the universe
    self.universe = self.nextGeneration;
    NSLog(@"Next generation: %@", self.nextGeneration);
}


@end
