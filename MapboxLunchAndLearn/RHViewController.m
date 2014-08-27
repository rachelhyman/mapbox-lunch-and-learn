//
//  RHViewController.m
//  MapboxLunchAndLearn
//
//  Created by Rachel Hyman on 5/9/14.
//  Copyright (c) 2014 Rachel Hyman. All rights reserved.
//

#import "RHViewController.h"

@interface RHViewController ()

@end

@implementation RHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createMapView];
    
    [self addClusteredPoints];
    self.mapView.clusteringEnabled = YES;
    
    [self addAnnotation];

    [self addFancyAnnotation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)createMapView {
    RMMapboxSource *tileSource = [[RMMapboxSource alloc] initWithMapID:@"rhyman.hope464m"];
    
    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:tileSource];
    self.mapView = mapView;
    self.mapView.delegate = self;
    
    [mapView setZoom:12 atCoordinate:CLLocationCoordinate2DMake(42.335416, -83.049161) animated:YES];
    
    [mapView setShowsUserLocation:YES];
    
    [self.view addSubview:mapView];

}

-(void)addAnnotation {
    RMPointAnnotation *annotation = [[RMPointAnnotation alloc] initWithMapView:self.mapView
                                                                    coordinate:CLLocationCoordinate2DMake(42.358988, -83.027287)
                                                                      andTitle:@"Restaurant"];
    
    [self.mapView addAnnotation:annotation];

}

-(void)addFancyAnnotation {
    RMAnnotation *annotation = [[RMAnnotation alloc] initWithMapView:self.mapView
                                                             coordinate:CLLocationCoordinate2DMake(42.363618, -83.089943)

                                
                                
                                                            andTitle:@"Fancy Restaurant"];
    
    [self.mapView addAnnotation:annotation];
}

//-(RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation {
//    if (annotation.isUserLocationAnnotation) {
//        return nil;
//    }
//    
//    RMMarker *marker = [[RMMarker alloc] initWithMapboxMarkerImage:@"fast-food"
//                                                         tintColor:[UIColor orangeColor]];
//    
//    marker.canShowCallout = YES;
//    
//    return marker;
//}


-(void)addClusteredPoints{
    [self.mapView addAnnotation:[RMAnnotation annotationWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake(42.358988, -83.027287) andTitle:nil]];
    [self.mapView addAnnotation:[RMAnnotation annotationWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake(42.363618, -83.089943) andTitle:nil]];
    [self.mapView addAnnotation:[RMAnnotation annotationWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake(42.354485, -83.063164) andTitle:nil]];
    [self.mapView addAnnotation:[RMAnnotation annotationWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake(42.347253, -83.106422) andTitle:nil]];
    [self.mapView addAnnotation:[RMAnnotation annotationWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake(42.336215, -83.090715) andTitle:nil]];
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation
{
    if (annotation.isUserLocationAnnotation)
        return nil;
    
    RMMapLayer *layer = nil;
    
    if (annotation.isClusterAnnotation) {
        layer = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"circle.png"]];
        layer.opacity = 0.75;
        [(RMMarker *)layer setTextForegroundColor:[UIColor blackColor]];
        [(RMMarker *)layer changeLabelUsingText:[NSString stringWithFormat:@"%i", [annotation.clusteredAnnotations count]]
                                       position:CGPointMake(40, 35)];
        layer.bounds = CGRectMake(0, 0, 95, 95);
        return layer;
    }
    
    else {
        RMMarker *marker = [[RMMarker alloc] initWithMapboxMarkerImage:@"fast-food"
                                                tintColor:[UIColor orangeColor]];
        layer = marker;
    }
    return layer;
}


@end
