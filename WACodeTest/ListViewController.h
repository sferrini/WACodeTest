//
//  ListViewController.h
//  WACodeTest
//
//  Created by Simone Ferrini on 04/06/14.
//  Copyright (c) 2014 sferrini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *listTextView;

@property (strong, nonatomic) NSArray *boardingCardsArray;

@end
