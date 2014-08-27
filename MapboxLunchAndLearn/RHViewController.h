//
//  RHViewController.h
//  MapboxLunchAndLearn
//
//  Created by Rachel Hyman on 5/9/14.
//  Copyright (c) 2014 Rachel Hyman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mapbox/Mapbox.h>

@interface RHViewController : UIViewController <RMMapViewDelegate>

@property RMMapView *mapView; 

@end
