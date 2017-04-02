//
//  VC_offerLocation.swift
//  Jaiben
//
//  Created by kidnapper on 02/04/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class VC_offerLocation: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate {
    
    var geoCoder: CLGeocoder!
    var manager = CLLocationManager()
    var previousAddress: String!
    
    @IBOutlet var map: MKMapView!
    @IBOutlet var address: UITextField!
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        print("A")
        self.map.centerCoordinate = location.coordinate
        print("B")
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.005, 0.005)
        print("C")
        let reg = MKCoordinateRegionMake(location.coordinate, span)
        print("D")
        map.setRegion(reg, animated: true)
        geoCode(location: location)
        manager.stopUpdatingLocation()
    }
    func geoCode(location: CLLocation!){
        geoCoder.cancelGeocode()
        geoCoder.reverseGeocodeLocation(location, completionHandler: {
            (data, error) -> Void in
            guard let placemarks = data as [CLPlacemark]! else{
                return
            }
            let loc: CLPlacemark = placemarks[0]
            let addressDict: [NSString:NSObject] = loc.addressDictionary as! [NSString:NSObject]
            let addrList = addressDict["FormattedAddressLines"] as! [String]
            let address = addrList.joined(separator: ", ")
            print("address = \(address)")
            print("一")
            self.address.placeholder = address
            self.previousAddress = address
        
        })
    }
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let location = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        geoCode(location: location)
        print("hereererere")
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error = \(error)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
        manager.startUpdatingLocation()
        geoCoder = CLGeocoder()
        self.map.delegate = self
        self.address.delegate = self
//        self.mapView(map, regionDidChangeAnimated: true)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
        self.view.resignFirstResponder()
        print("end editing")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        print("what is this for")
        return true
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
