//
//  HomeViewModel.swift
//  BarqTask
//
//  Created by Mena Gamal on 5/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import CoreLocation
import GoogleMaps

class HomeViewModel :NSObject, CLLocationManagerDelegate {
    
    private var view:HomeView!
    private var API:HomeService
    let locationManager = CLLocationManager()
    
    enum Actions {
        case StartLoading , StopLoading , getAllVideos , Error
    }
    
    init(view:HomeView,API:HomeService) {
        self.view = view
        self.API = API
        locationManager.requestAlwaysAuthorization()
    }
    
    func getAllVideos() {
        self.view.update(actions: .StartLoading)
        API.getAllVideos { (result) in
            self.view.update(actions: .StopLoading)
            switch result{
            case .success(let response):
                print(response.videos)
                break
            case .failure(let error):
                break
                
            }
        }
    }
    
    
    func AddPin()  {
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            guard let currentLocation = locationManager.location else {
                return
            }
            print(currentLocation.coordinate.latitude)
            print(currentLocation.coordinate.longitude)
            
            let camera = GMSCameraPosition.camera(withLatitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude, zoom: 17.0)
            
            self.view.mapView.animate(to: camera)
            
            
            var position = CLLocationCoordinate2DMake(currentLocation.coordinate.latitude,currentLocation.coordinate.longitude)
            var marker = GMSMarker(position: position)
            marker.title = "My Location"
            marker.map = self.view.mapView
            
            
        }
        
    }
 
    
}
