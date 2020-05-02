//
//  CountryDetailViewController.swift
//  Covid19
//
//  Created by Danish Khan on 01/05/20.
//  Copyright © 2020 Danish Khan. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    var countryDetail: CountryRecord?
    
    @IBOutlet weak var confirmedLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var newCasesLabel: UILabel!
    @IBOutlet weak var newDeathsLabel: UILabel!
    @IBOutlet weak var cauntryLabel: UILabel!
    @IBOutlet weak var criticalLabel: UILabel!



    override func viewDidLoad() {
        super.viewDidLoad()
        confirmedLabel.text = countryDetail?.confirmed
        recoveredLabel.text = countryDetail?.recovered
        deathsLabel.text = countryDetail?.deaths
        newDeathsLabel.text = countryDetail?.newDeaths
        newCasesLabel.text = countryDetail?.newCases
        cauntryLabel.text = countryDetail?.countryName
        criticalLabel.text = countryDetail?.critical
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
