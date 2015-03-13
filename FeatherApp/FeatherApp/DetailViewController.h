//
//  DetailViewController.h
//  FeatherApp
//
//  Created by Kenneth Lin on 3/12/15.
//  Copyright (c) 2015 Feather. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

