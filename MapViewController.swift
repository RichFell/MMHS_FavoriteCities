//
//  MapViewController.swift
//  MMHS_FavoriteCities
//
//  Created by Richard Fellure on 7/23/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController
{

    var city : String = ""
    var cities : [String] = []

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(city, completionHandler: { placeMarks, error in
            if error
            {
                println(error.localizedDescription)
            }
            else
            {
                let placeMark = placeMarks[0] as CLPlacemark

                self.mapView.centerCoordinate = placeMark.location.coordinate

                self.mapView.region.span = MKCoordinateSpanMake(1.0, 1.0)
            }
            })

        for favorite in cities
        {
            createMapAnnotations(favorite)
        }
    }

    //Helper function that adds the annotations to the map
    func createMapAnnotations(cityString: String)
    {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(cityString, completionHandler: { placemarks, error in
            if error
            {
                println(error.localizedDescription)
            }
            else
            {
                let placemark = placemarks[0] as CLPlacemark
                let annotation = MKPointAnnotation()
                annotation.coordinate = placemark.location.coordinate
                annotation.title = cityString

                self.mapView.addAnnotation(annotation)
            }
            })
    }

}
