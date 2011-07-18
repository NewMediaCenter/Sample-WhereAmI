//
//  sample_whereamiAppDelegate.h
//  sample-whereami
//
//  Created by Jerrad Thramer on 7/15/11.
//  Copyright 2011 UNL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>



@interface sample_whereamiAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate> {
    CLLocationManager *locationManager;
    IBOutlet MKMapView *worldView;
    IBOutlet UITextView *textBox;
    MKReverseGeocoder *reverseGeocoder;


}

-(void)findLocation;
-(void)foundLocation:(CLLocation *)loc;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MKReverseGeocoder *reverseGeocoder;

@end
