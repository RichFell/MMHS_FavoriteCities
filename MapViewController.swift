//
//  MapViewController.swift
//  MMHS_FavoriteCities
//
//  Created by Richard Fellure on 7/23/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var city = String()

    override func viewDidLoad() {
        super.viewDidLoad()

      navigationItem.title = city
    }



}
