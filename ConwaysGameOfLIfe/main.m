//
//  main.m
//  ConwaysGameOfLIfe
//
//  Created by Lucyna Galik on 20/02/2017.
//  Copyright © 2017 Lucyna Galik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Universe.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //create a universe
        Universe *myFirstUniverse = [[Universe alloc] initWithNumberOfRows: 10 andCollumns: 10];
        
        //make first 5 generations
        for (int i = 0 ; i < 5; i++) {
            [myFirstUniverse moveToNextGeneration];
        }
        
    }
    return 0;
}
