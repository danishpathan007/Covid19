//
//  CountryListViewController.swift
//  Covid19
//
//  Created by Danish Khan on 02/05/20.
//  Copyright © 2020 Danish Khan. All rights reserved.
//


import UIKit
import SVProgressHUD
class CountryListViewController: UIViewController {
   
 
    @IBOutlet weak var tableView: UITableView!
    var allCounty:[CountryRecord] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let worldDataFetch = WorldDataFetchRequest()
        worldDataFetch.delegate = self
        tableView.register(UINib(nibName: "RecentViewCell", bundle: nil), forCellReuseIdentifier: "RecentViewCell")
        tableView.register(UINib(nibName: "RecentHeaderTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "RecentHeaderTableViewCell")
    }
    
    
    private func showCountryDetailView( sender: Any?) {
          let storyBoard = UIStoryboard(name: "Main", bundle: nil)
          guard let countryDetailViewController = storyBoard.instantiateViewController(withIdentifier:"CountryDetailViewController") as? CountryDetailViewController else { return }
          if let indexPath = sender as? IndexPath {
            countryDetailViewController.countryDetail = allCounty[indexPath.row]
            countryDetailViewController.modalPresentationStyle = .overCurrentContext
            countryDetailViewController.modalTransitionStyle = .crossDissolve
            self.present(countryDetailViewController, animated: true, completion: nil)
          }
      }
}

//MARK: - UITableViewDelegate

extension CountryListViewController: UITableViewDelegate{
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
        showCountryDetailView(sender: indexPath)
    }
}

//MARK: - UITableViewDataSource
extension CountryListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCounty.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentViewCell", for: indexPath) as! RecentViewCell
        cell.countyLabel.text = "  \(indexPath.row + 1). " + allCounty[indexPath.row].countryName
        cell.confirmCaseLabel.text = allCounty[indexPath.row].confirmed
       // cell.deathLabel.text = allCounty[indexPath.row].deaths
       // cell.recoverLabel.text = allCounty[indexPath.row].recovered
        return cell
    }
}

//MARK: - WorldDataFetchRequestDelegate
extension CountryListViewController: WorldDataFetchRequestDelegate{
    func getAllCountry(allCountries: [CountryRecord]) {
        self.allCounty = allCountries
        tableView.reloadData()
        Loader.hide()
    }
    
    func getWorldTotal(totalData: WorldData) {}
}
