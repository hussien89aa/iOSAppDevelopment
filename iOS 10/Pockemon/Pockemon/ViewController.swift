//
//  ViewController.swift
//  Pockemon
//
//  Created by hussien alrubaye on 1/31/17.
//  Copyright © 2017 hussien alrubaye. All rights reserved.
//

import UIKit
import GoogleMaps
class ViewController: UIViewController,GMSMapViewDelegate
,CLLocationManagerDelegate{
    var mapView:GMSMapView!
    let locationManager=CLLocationManager()
    var ListPockemno=[Pockemons]()
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadPockemons()
        self.locationManager.requestAlwaysAuthorization()
        // get access klocation permion
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate=self
            locationManager.desiredAccuracy=kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        let camera=GMSCameraPosition.camera(withLatitude: 43, longitude: -77, zoom: 10)
        mapView=GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate=self
       self.view=mapView
        
       
    }

    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("you tapped at \(coordinate.latitude):\(coordinate.longitude)")
    }
    
    var locValue:CLLocationCoordinate2D=CLLocationCoordinate2D(latitude: 0, longitude: 0)
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if manager.location!.coordinate.latitude==locValue.latitude &&
            manager.location!.coordinate.longitude==locValue.longitude {
            return
        }
        
        locValue=manager.location!.coordinate
         print("user update at \(locValue.latitude):\(locValue.longitude)")
        self.mapView.clear()
        // add the pockenmon ctach man
        let marker=GMSMarker()
        marker.position=CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude)
        marker.title="me"
        marker.snippet="here is player location"
        marker.icon=UIImage(named:"mario")
        marker.map=self.mapView
        
        // add pockemnos
        var index=0
        for pockemon in ListPockemno{
            if pockemon.isCatch==false {
                
            let marker1=GMSMarker()
            marker1.position=CLLocationCoordinate2D(latitude:pockemon.latitude!, longitude: pockemon.longitude!)
            marker1.title=pockemon.name!
            marker1.snippet="\(pockemon.des!), his power is \(pockemon.power!)"
            marker1.icon=UIImage(named:pockemon.Image!)
            marker1.map=self.mapView
                
                // if he find pockmeno
                if  (Double(locValue.latitude).roundTo(places: 4) == Double(pockemon.latitude!).roundTo(places: 4)) &&
                    (Double(locValue.longitude).roundTo(places: 4) == Double(pockemon.longitude!).roundTo(places: 4))
                {
                    ListPockemno[index].isCatch=true
                    AlerDialog(power:pockemon.power!)
                    
                }
            }
           index=index+1
        }
          let camera=GMSCameraPosition.camera(withLatitude: locValue.latitude, longitude:  locValue.longitude, zoom: 15)
        self.mapView.camera=camera
    }

    
    func LoadPockemons(){
        self.ListPockemno.append(Pockemons(latitude:  37.7789994893035,longitude: -122.401846647263, Image: "Charmander",name:"Charmander",des: "Charmander living in japan",power:55))
        self.ListPockemno.append(Pockemons(latitude: 37.7949568502667, longitude:  -122.410494089127, Image: "Bulbasaur",name:"Bulbasaur",des: "Bulbasaur living in usa",power:90.5))
        self.ListPockemno.append(Pockemons(latitude:  37.7816621152613, longitude:-122.41225361824  , Image: "Squirtle",name:"Squirtle",des: "Squirtle living in iraq",power:33.5))
    }

 var TotalGain=0.0
//show later
func AlerDialog(power:Double){
    self.TotalGain=self.TotalGain + power
    let alert = UIAlertController(title: "Coins", message: "Catch new pokemon with power \(power)", preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,
                                  handler: { action in
                                    print("+ one")
    }))
    self.present(alert, animated: true, completion: nil)
}

    }
extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    
}

