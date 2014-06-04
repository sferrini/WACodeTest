//
//  BoardingCard.h
//  WACodeTest
//
//  Created by Simone Ferrini on 04/06/14.
//  Copyright (c) 2014 sferrini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailOfTransport.h"

@interface BoardingCard : NSObject

@property (strong, nonatomic) NSString *departureCity;
@property (strong, nonatomic) NSString *destinationCity;
@property (strong, nonatomic) DetailOfTransport *detailOfTransport;

- (instancetype)initBoardingCardStartingFrom:(NSString *)departure
                                  arrivingTo:(NSString *)destination
                                       using:(DetailOfTransport *)detail;

@end
