//
//  DetailOfTransport.h
//  WACodeTest
//
//  Created by Simone Ferrini on 04/06/14.
//  Copyright (c) 2014 sferrini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailOfTransport : NSObject

@property (strong, nonatomic) NSString *vehicle;
@property (strong, nonatomic) NSString *number;
@property (strong, nonatomic) NSString *seat;
@property (strong, nonatomic) NSString *gate;
@property (strong, nonatomic) NSString *info;

- (instancetype)initDetailTransportWithVehicle:(NSString *)vehicle
                                    withNumber:(NSString *)number
                                      withSeat:(NSString *)seat
                                      fromGate:(NSString *)gate
                                      withInfo:(NSString *)info;

@end
