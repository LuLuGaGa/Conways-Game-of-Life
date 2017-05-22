//
//  Universe.h
//  ConwaysGameOfLIfe
//
//  Created by Lucyna Galik on 20/02/2017.
//  Copyright © 2017 Lucyna Galik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Universe : NSOperation
@property int numberOfRows;
@property int numberOfColumns;
@property (strong, nonatomic) NSMutableArray *universe;
@property (strong, nonatomic) NSMutableArray *nextGeneration;

- (id) initWithNumberOfRows: (int) numberOfRows andCollumns: (int) numberOfColumns;
- (void) moveToNextGeneration;

@end
