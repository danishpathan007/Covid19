//
//  RecentViewController.swift
//  Covid19
//
//  Created by Danish Khan on 30/04/20.
//  Copyright © 2020 Danish Khan. All rights reserved.
//

import UIKit
import SVProgressHUD
class RecentViewController: UIViewController {
   
 
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cinfirmedLabel: UILabel!
    @IBOutlet weak var criticalLabel: UILabel!
    @IBOutlet weak var deathLabel: UILabel!
    @IBOutlet weak var deathPerLabel: UILabel!
    @IBOutlet weak var recoveredlLabel: UILabel!
    @IBOutlet weak var recoveryPerLabel: UILabel!
    
    
    
    var covidfetchRequest = CovidFetchRequest()
    var totalData:TotalData?
    var allCounty:[CountryData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Loader.show(progress: 22.2, with: "Loadning")
        covidfetchRequest.delegate = self
        tableView.register(UINib(nibName: "RecentViewCell", bundle: nil), forCellReuseIdentifier: "RecentViewCell")
        tableView.register(UINib(nibName: "RecentHeaderTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "RecentHeaderTableViewCell")
    }
    
    
    private func setData() {
        cinfirmedLabel.text = totalData?.confirmed.formatNumber()
        criticalLabel.text = totalData?.critical.formatNumber()
        deathLabel.text = totalData?.deaths.formatNumber()
        deathPerLabel.text = totalData?.fatalityRate.string(maximumFractionDigits: 2)
        recoveredlLabel.text = totalData?.recovered.formatNumber()
        recoveryPerLabel.text = totalData?.recoverRate.string(maximumFractionDigits: 2)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? CountryDetailViewController
        
        if let indexPath = sender as? IndexPath {
            vc?.countryDetail = allCounty[indexPath.row]
        }
    }
}

//MARK: - UITableViewDelegate

extension RecentViewController: UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
           return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "RecentHeaderTableViewCell") as! RecentHeaderTableViewCell
        header.contentView.backgroundColor = UIColor.groupTableViewBackground
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GoToDetails", sender: indexPath)
    }
}

//MARK: - UITableViewDataSource
extension RecentViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCounty.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentViewCell", for: indexPath) as! RecentViewCell
        cell.countyLabel.text = allCounty[indexPath.row].country
        cell.confirmCaseLabel.text = allCounty[indexPath.row].confirmed.formatNumber()
        cell.deathLabel.text = allCounty[indexPath.row].deaths.formatNumber()
        cell.recoverLabel.text = allCounty[indexPath.row].recovered.formatNumber()
        return cell
    }
}

//MARK: - CovidFetchRequestDelegate
extension RecentViewController: CovidFetchRequestDelegate{
    func getCurrentTotal(totalData: TotalData) {
        self.totalData = totalData
        self.setData()
    }
    
    func getAllCountry(allCountries: [CountryData]) {
        self.allCounty = allCountries
        self.tableView.reloadData()
        Loader.hide()
        
    }
}

