//
//  DetailViewController.m
//  FeatherApp
//
//  Created by Kenneth Lin on 3/12/15.
//  Copyright (c) 2015 Feather. All rights reserved.
//

#import "DetailViewController.h"
#import "Event.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIView *date;

@end

@implementation DetailViewController
@synthesize titleLabel;


#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        Event *event = self.detailItem;
        //self.detailDescriptionLabel.text = [NSString stringWithFormat:@"%@",event.date];
        self.titleLabel.text =[NSString stringWithFormat:@"%@", event.title];
        self.detailDescriptionLabel.text =[NSString stringWithFormat:@"%@", event.desc];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
