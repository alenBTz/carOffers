//
//  MapViewController.swift
//  sixtRentACar
//
//  Created by Alen Basic on 9/26/17.
//  Copyright © 2017 alenbasic. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var carLocation = CLLocation()
    var nameOfClient: String? = nil

//MARK - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
//MARK - Setup View

    func setupView(){
        self.mapView!.delegate = self
        setMapRegionToCoordinate(coordinate: carLocation.coordinate)
        addAnnotationWithDetails()
}
    
    func setMapRegionToCoordinate(coordinate: CLLocationCoordinate2D){
        let adjustedRegion: MKCoordinateRegion = self.mapView!.regionThatFits(MKCoordinateRegionMakeWithDistance(coordinate, 2500, 2500))
        self.mapView!.setRegion(adjustedRegion, animated: true)
    }
    
    func addAnnotationWithDetails(){
        let annotation = MKPointAnnotation()
        annotation.title = nameOfClient
        annotation.coordinate = carLocation.coordinate
        mapView!.addAnnotation(annotation)
    }
    
}
