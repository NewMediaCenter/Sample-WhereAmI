//
//  sample_whereamiAppDelegate.m
//  sample-whereami
//
//  Created by Jerrad Thramer on 7/15/11.
//  Copyright 2011 UNL. All rights reserved.
//

#import "sample_whereamiAppDelegate.h"


@implementation sample_whereamiAppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //create location manager obj
    locationManager = [[CLLocationManager alloc] init];
    
    [locationManager setDelegate:self];

    
    
    // set no filter -- want all results
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    //set max accuracy
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    //start
    [locationManager startUpdatingHeading];
    [locationManager startUpdatingLocation];
    NSLog(@"Starting");
    int loccount = 0;
    int hdgcount = 0;
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    NSLog(@"Update Found");
    NSLog(@"%@",newLocation);
    //[screenText setText:@"yay this works"];
    
    locationText.text = [newLocation description];
    float mph = [newLocation speed] * 3.6;
    locationText.text = [locationText.text stringByAppendingString:[NSString stringWithFormat:@" \n\n MPH: %f", mph]];
    
    locationText.text = [locationText.text stringByAppendingString:[NSString stringWithFormat:@" \n\nALT: %f", [newLocation altitude]]];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    
    headingText.text = [newHeading description];
    
   
    
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    locationText.text = [locationText.text stringByAppendingString:@"ERROR: "];
    locationText.text = [locationText.text stringByAppendingString:[error description]];
    locationText.text = [locationText.text stringByAppendingString:@"\n"];
    NSLog(@"ERR: CouldNotFindLocation: %@", error);
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end