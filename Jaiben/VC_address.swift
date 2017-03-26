//
//  VC_address.swift
//  Jaiben
//
//  Created by kidnapper on 26/03/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit
import MapKit

class VC_address: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(storeData.address!, completionHandler: {
            placemarks, error in
            if error != nil{
                print("error = \(error)")
                return
            }
            if let placemarks = placemarks {
                let placemark = placemarks[0]
                
                let annotation = MKPointAnnotation()
                annotation.title = storeData.name
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.deselectAnnotation(annotation, animated: true)
                }
            }
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
