//
//  sample_whereamiAppDelegate.m
//  sample-whereami
//
//  Created by Jerrad Thramer on 7/15/11.
//  Copyright 2011 UNL. All rights reserved.
//

#import "sample_whereamiAppDelegate.h"
#import "MapPoint.h"

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
   // [locationManager startUpdatingLocation];
    NSLog(@"Starting");
    [worldView setShowsUserLocation:YES];
    
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}



- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:TRUE];
    
}
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    
  
    
   
    
}
-(void)findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];

}
-(void)foundLocation:(CLLocation *)loc;
{
    CLLocationCoordinate2D coord = [loc coordinate];
    //create an instance of mappoint with current data
    MapPoint *mp = [[MapPoint alloc] initWithCoordinate:coord title:[locationTitleField text]];
    
    //add it
    [worldView addAnnotation:mp];
    //since worldview retains, we release.
    [mp release];
    
    //zoom into this location
    MKCoordinateRegion foundRegion = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:foundRegion animated:YES];
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];
    [textField resignFirstResponder];
    return TRUE;
}
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    
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