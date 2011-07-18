//
//  MapPoint.m
//  sample-whereami2
//
//  Created by Jerrad Thramer on 7/18/11.
//  Copyright 2011 UNL. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint
@synthesize coordinate, title;

- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t
{
    self = [super init];
    if (self) {
        coordinate = c;
        [self setTitle: t];
    }
    return self;
}

- (void)dealloc
{
    [title release];
    [super dealloc];
}
@end
