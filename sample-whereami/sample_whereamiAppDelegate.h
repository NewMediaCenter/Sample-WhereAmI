//
//  sample_whereamiAppDelegate.h
//  sample-whereami
//
//  Created by Jerrad Thramer on 7/15/11.
//  Copyright 2011 UNL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface sample_whereamiAppDelegate : NSObject <UIApplicationDelegate> {
    CLLocationManager *locationManager;
    
    IBOutlet UITextView *locationText;
    IBOutlet UITextView *headingText;
}

int loccount;
int hdgcount;
@property (nonatomic, retain) IBOutlet UIWindow *window;


@end
