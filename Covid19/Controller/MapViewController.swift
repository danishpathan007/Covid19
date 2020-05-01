//
//  MapViewController.swift
//  Covid19
//
//  Created by Danish Khan on 01/05/20.
//  Copyright © 2020 Danish Khan. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var covidfetchRequest = CovidFetchRequest()
    var totalData:TotalData?
    var allCounty:[CountryData] = []
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        covidfetchRequest.delegate = self
    }
    
    
    func addPin(on country:CountryData) {
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: country.latitude, longitude: country.longitude)
        annotation.coordinate = centerCoordinate
        annotation.title = "\(country.country)Confirmed \(country.confirmed.formatNumber()) Death\(country.deaths.formatNumber())"
        mapView.addAnnotation(annotation)
    }
    
}


//MARK: - CovidFetchRequestDelegate
extension MapViewController: CovidFetchRequestDelegate{
    func getCurrentTotal(totalData: TotalData) {
        self.totalData = totalData
        
    }
    
    func getAllCountry(allCountries: [CountryData]) {
        self.allCounty = allCountries
        allCounty.forEach { (country) in
            addPin(on: country)
        }
        Loader.hide()
    }
}
