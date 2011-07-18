//
//  MapPoint.h
//  sample-whereami2
//
//  Created by Jerrad Thramer on 7/18/11.
//  Copyright 2011 UNL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface MapPoint : NSObject <MKAnnotation>
{
    NSString *title;
    CLLocationCoordinate2D coordinate;
}

//new designated initializer for instances of MapPoint
- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t;

//req'd prop
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
//optional prop
@property (nonatomic, copy) NSString *title;
@end
