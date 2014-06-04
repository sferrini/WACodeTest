//
//  ListViewController.m
//  WACodeTest
//
//  Created by Simone Ferrini on 04/06/14.
//  Copyright (c) 2014 sferrini. All rights reserved.
//

#import "ListViewController.h"

#import "BoardingCard.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.listTextView.layer.cornerRadius = 10;
    
    [self createList];
}

- (void)createList
{
    NSMutableString *tripList = [[NSMutableString alloc] init];
    
    for (BoardingCard *boardingCard in self.boardingCardsArray) {
        
        [tripList appendString:@"- "];
        
        [tripList appendString:[NSString stringWithFormat:@"From %@, ", boardingCard.departureCity]];
        [tripList appendString:[NSString stringWithFormat:@"take %@ ", boardingCard.detailOfTransport.vehicle]];
        
        if (boardingCard.detailOfTransport.number) {
            [tripList appendString:[NSString stringWithFormat:@"%@ ", boardingCard.detailOfTransport.number]];
        }
        
        [tripList appendString:[NSString stringWithFormat:@"to %@, ", boardingCard.destinationCity]];
        
        if (![boardingCard.detailOfTransport.seat isEqual:@""]) {
            [tripList appendString:[NSString stringWithFormat:@"your seat is %@. ", boardingCard.detailOfTransport.seat]];
        }
        
        if (![boardingCard.detailOfTransport.gate isEqual:@""]){
            [tripList appendString:[NSString stringWithFormat:@"The gate is %@. ", boardingCard.detailOfTransport.gate]];
        }
        
        if (![boardingCard.detailOfTransport.info isEqualToString:@""]){
            [tripList appendString:[NSString stringWithFormat:@"%@. ", boardingCard.detailOfTransport.info]];
        }
        
        [tripList appendString:@"\n\n"];
    }
    
    [tripList appendString:@"You have arrived at your final destination!"];
    
    [self.listTextView setText:tripList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
