//
//  MapViewController.h
//  HighBall
//
//  Created by imac on 15-5-8.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<BMKMapViewDelegate,BMKGeoCodeSearchDelegate>{
    BMKGeoCodeSearch *_geoSearch;
    IBOutlet BMKMapView *_mapView;
    
}
//批量解析实际地址，把地址传递过来
//@property(nonatomic,strong)NSArray *mapsArr;
@end
