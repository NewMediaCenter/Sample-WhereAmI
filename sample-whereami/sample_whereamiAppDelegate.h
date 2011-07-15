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
    IBOutlet UITextView *screenText;
   
}


@property (nonatomic, retain) IBOutlet UIWindow *window;



@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
