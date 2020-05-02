//
//  MapViewController.swift
//  Covid19
//
//  Created by Danish Khan on 01/05/20.
//  Copyright © 2020 Danish Khan. All rights reserved.
//

import UIKit
import MapKit

class IndiaDataViewController: UIViewController {
    var indiaData:IndiaRecord?
    
    @IBOutlet weak var confirmedLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var activeLabel: UILabel!
    @IBOutlet weak var updatedAtLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let indiaDataFetchRequest =  IndiaDataFetchRequest()
        indiaDataFetchRequest.delegate = self
    }
        
    private func setData() {
          confirmedLabel.text = indiaData?.confirmed
          deathsLabel.text = indiaData?.deaths
          recoveredLabel.text = indiaData?.recovered
          activeLabel.text = indiaData?.active
          updatedAtLabel.text = indiaData?.updatedAt
      }
    
}

extension IndiaDataViewController: IndiaDataFetchRequestDelegate{
    func getIndiaTotal(totalData: IndiaRecord) {
        self.indiaData = totalData
        setData()
        Loader.hide()
    }
}

