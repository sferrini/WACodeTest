//
//  BoardingCard.m
//  WACodeTest
//
//  Created by Simone Ferrini on 04/06/14.
//  Copyright (c) 2014 sferrini. All rights reserved.
//

#import "BoardingCard.h"

@implementation BoardingCard

- (instancetype)initBoardingCardStartingFrom:(NSString *)departure
                                  arrivingTo:(NSString *)destination
                                       using:(DetailOfTransport *)detail
{
    self = [super init];
    if (self) {
        self.departureCity = departure;
        self.destinationCity = destination;
        self.detailOfTransport = detail;
    }
    return self;
}

@end
