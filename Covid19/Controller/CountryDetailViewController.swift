//
//  CountryDetailViewController.swift
//  Covid19
//
//  Created by Danish Khan on 01/05/20.
//  Copyright © 2020 Danish Khan. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    var countryDetail: CountryData?

    override func viewDidLoad() {
        super.viewDidLoad()
        print(countryDetail?.confirmed)
        print(countryDetail?.country)
    }
    


}
