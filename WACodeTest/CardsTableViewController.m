//
//  CardsTableViewController.m
//  WACodeTest
//
//  Created by Simone Ferrini on 04/06/14.
//  Copyright (c) 2014 sferrini. All rights reserved.
//

#import "CardsTableViewController.h"

#import "CustomCardTableViewCell.h"

#import "ListViewController.h"

#import "BoardingCard.h"

#import "DeparturePlaceAlgorithm.h"

@interface CardsTableViewController ()

@property (strong, nonatomic) NSMutableArray *boardingCardsArray;

@end

@implementation CardsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.routeButton.enabled = NO;
    
    [self initAllBoardingCards];
}

#pragma mark - BoardingCards

- (void)initAllBoardingCards
{
    self.boardingCardsArray = [[NSMutableArray alloc] init];
    
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"boardingCards"
                                                                                  ofType:@"json"]];
    
    NSDictionary *boardingCards = [[NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves
                                                                     error:nil] objectForKey:@"boardingCards"];
    
    for (id card in boardingCards) {
        
        
        DetailOfTransport *details = [[DetailOfTransport alloc] initDetailTransportWithVehicle:[card objectForKey:@"type"]
                                                                                    withNumber:[card objectForKey:@"number"]
                                                                                      withSeat:[card objectForKey:@"seat"]
                                                                                      fromGate:[card objectForKey:@"gate"]
                                                                                      withInfo:[card objectForKey:@"info"]];
        
        BoardingCard *boardingCard = [[BoardingCard alloc] initBoardingCardStartingFrom:[[card objectForKey:@"locations"] objectAtIndex:0]
                                                                             arrivingTo:[[card objectForKey:@"locations"] objectAtIndex:1]
                                                                                  using:details];
        
        [self.boardingCardsArray addObject:boardingCard];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sortTrip:(id)sender
{
    NSLog(@"%@", [DeparturePlaceAlgorithm findDeparturePlaceWithCards:self.boardingCardsArray]);
    
    [self.tableView reloadData];
    
    self.sortTripButton.enabled = NO;
    self.routeButton.enabled = YES;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.boardingCardsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    //Get boardingCard from boardingCardsArray.
    BoardingCard *boardingCard = [self.boardingCardsArray objectAtIndex:indexPath.row];
    
    //Cell settings
    cell.travelSectionLabel.text = [NSString stringWithFormat:@"%@ - %@", boardingCard.departureCity, boardingCard.destinationCity];
    
    cell.vehicleLabel.text = boardingCard.detailOfTransport.vehicle;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"list"]) {
        // Get reference to the destination view controller
        ListViewController *vc = [segue destinationViewController];
        
        vc.boardingCardsArray = self.boardingCardsArray;
    }
}

- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue
{
    
}

@end
