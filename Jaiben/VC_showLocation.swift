//
//  VC_offerLocation.swift
//  Jaiben
//
//  Created by kidnapper on 20/10/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class VC_showLocation: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet var map: MKMapView!
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error = \(error)")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let regionDistance:CLLocationDistance = 100
        let regionSpan = MKCoordinateRegionMakeWithDistance(storeData.storeLocation!, regionDistance, regionDistance)
//        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        if #available(iOS 10.0, *) {
            let placemark = MKPlacemark(coordinate: storeData.storeLocation!)
            let annotation = MKPointAnnotation()
            annotation.title = "\((storeData.name)!)"
            annotation.coordinate = (placemark.location?.coordinate)!
            map.setRegion(regionSpan, animated: true)
            map.showAnnotations([annotation], animated: true)
            map.selectAnnotation(annotation, animated: true)
            
            
        } else {
            // Fallback on earlier versions
        }

    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
}

