//
//  DataViewController.h
//  Feather
//
//  Created by Michael Lin on 3/3/15.
//  Copyright (c) 2015 Feather Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;

@end

