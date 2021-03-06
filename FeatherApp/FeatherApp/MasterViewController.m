//
//  MasterViewController.m
//  FeatherApp
//
//  Created by Kenneth Lin on 3/12/15.
//  Copyright (c) 2015 Feather. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "SWRevealViewController.h"

#import "Event.h"
#import "AddEventViewController.h"

#import "Parse/Parse.h"

@interface MasterViewController ()

@property NSMutableArray *objects;

@end

@implementation MasterViewController



- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    AddEventViewController *source = [segue sourceViewController];
    Event *item = source.event;
    if (item != nil) {
        if (!self.objects) {
            self.objects = [[NSMutableArray alloc] init];
        }
        [self.objects insertObject:item atIndex:0];
        [self.tableView reloadData];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // self.navigationItem.leftBarButtonItem = self.editButtonItem;

    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];

    // Set up side menu bar.
    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController) {
        [self.menuButton setTarget:revealViewController];
        [self.menuButton setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:revealViewController.panGestureRecognizer];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Comments for example code
/*- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    Event *event = [[Event alloc] init];
    event.title = @"Event";
    event.date = [NSDate date];
    [self.objects insertObject:event atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}*/

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Event *event = self.objects[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", event.title];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",event.date];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
