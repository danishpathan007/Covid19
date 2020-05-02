//
//  WorldDataViewController.swift
//  Covid19
//
//  Created by Danish Khan on 01/05/20.
//  Copyright © 2020 Danish Khan. All rights reserved.
//

import UIKit

class WorldDataViewController: UIViewController {

    @IBOutlet weak var totalConfirmedLabel: UILabel!
    @IBOutlet weak var totalRecoveredLabel: UILabel!
    @IBOutlet weak var totalDeathsLabel: UILabel!
    @IBOutlet weak var newCasesLabel: UILabel!
    @IBOutlet weak var newDeathsLabel: UILabel!
    @IBOutlet weak var updatedAtLabel: UILabel!
    
    
    var worldDataFetch = WorldDataFetchRequest()
    var worldData:WorldData?
    override func viewDidLoad() {
        super.viewDidLoad()
        worldDataFetch.delegate = self
    }
    
    private func setData() {
        totalConfirmedLabel.text = worldData?.totalConfirmed
        totalDeathsLabel.text = worldData?.totalDeaths
        totalRecoveredLabel.text = worldData?.totalRecovered
        newCasesLabel.text = worldData?.newCases
        newDeathsLabel.text = worldData?.newDeaths
        updatedAtLabel.text = worldData?.updatedAt
    }
    
}

//MARK: - WorldDataFetchRequestDelegate
extension WorldDataViewController: WorldDataFetchRequestDelegate{
    func getAllCountry(allCountries: [CountryRecord]) {}
    
    func getWorldTotal(totalData: WorldData) {
        self.worldData = totalData
        setData()
        Loader.hide()
    }
}
