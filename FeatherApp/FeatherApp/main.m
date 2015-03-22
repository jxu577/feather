//
//  main.m
//  FeatherApp
//
//  Created by Kenneth Lin on 3/12/15.
//  Copyright (c) 2015 Feather. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    int retVal = 0;
    @autoreleasepool {
        NSString *classString = NSStringFromClass([AppDelegate class]);
        @try {
            retVal = UIApplicationMain(argc, argv, nil, classString);
        }
        @catch (NSException *exception) {
            NSLog(@"Exception - %@",[exception description]);
            exit(EXIT_FAILURE);
        }
    }
    return retVal;
  // @autoreleasepool {
  //     return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
  // }
}
