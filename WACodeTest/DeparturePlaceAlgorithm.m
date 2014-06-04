//
//  WAMAlgorithm.m
//  WACodeTest
//
//  Created by Simone Ferrini on 04/06/14.
//  Copyright (c) 2014 sferrini. All rights reserved.
//

#import "DeparturePlaceAlgorithm.h"

#import "BoardingCard.h"

@implementation DeparturePlaceAlgorithm

#pragma mark - Algorithm findDeparturePlace

+ (NSString *)findDeparturePlaceWithCards:(NSArray *)boardingCardsArray
{
    NSString *departurePossibly;
    
    for (BoardingCard *boardingCard in boardingCardsArray) {
        
        departurePossibly = boardingCard.departureCity;
        
        int number = 0;
        
        for(BoardingCard *boardingCardSecondLoop in boardingCardsArray) {
            
            if ([departurePossibly isEqualToString: boardingCardSecondLoop.destinationCity]) {
                break;
            }
            
            if (number == boardingCardsArray.count -1) {
                
                return boardingCardSecondLoop.departureCity;
            }
            number += 1;
        }
    }
    return nil;
}

@end
