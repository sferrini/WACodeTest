//
//  DetailOfTransport.m
//  WACodeTest
//
//  Created by Simone Ferrini on 04/06/14.
//  Copyright (c) 2014 sferrini. All rights reserved.
//

#import "DetailOfTransport.h"

@implementation DetailOfTransport

- (instancetype)initDetailTransportWithVehicle:(NSString *)vehicle
                                    withNumber:(NSString *)number
                                      withSeat:(NSString *)seat
                                      fromGate:(NSString *)gate
                                      withInfo:(NSString *)info
{
    self = [super init];
    
    if (self) {
        self.vehicle = vehicle;
        self.number = number;
        self.seat = seat;
        self.gate = gate;
        self.info = info;
    }
    return self;
}

@end
