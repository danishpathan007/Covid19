//
//  WorldDataFetchRequest.swift
//  Covid19
//
//  Created by Danish Khan on 01/05/20.
//  Copyright © 2020 Danish Khan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol WorldDataFetchRequestDelegate {
    func getWorldTotal(totalData:WorldData)
    func getAllCountry(allCountries:[CountryRecord])
}


class WorldDataFetchRequest: ObservableObject {
    
    
    var worldData:WorldData?
    var counriesData:[CountryRecord] = []
    var delegate:WorldDataFetchRequestDelegate?
    
    let headers:HTTPHeaders = [
        "x-rapidapi-host": "corona-virus-world-and-india-data.p.rapidapi.com",
        "x-rapidapi-key": "32bbb74a57mshe6cf7502152a171p1babafjsn25bda0d8443e"
    ]
        
    init() {
        Loader.show()
        getWorldTotal()
    }
        
    
    func getWorldTotal() {
        AF.request("https://corona-virus-world-and-india-data.p.rapidapi.com/api",headers: headers).responseJSON { response in
            let result = response.data
            var allCount: [CountryRecord] = []
            
            if result != nil{
                let json = JSON(result!)
                let worldTotal  = json["world_total"]
                let totalDeaths  = worldTotal["total_deaths"].string
                let totalRecovered  = worldTotal["total_recovered"].string
                let newCases  = worldTotal["new_cases"].string
                let totalCases  = worldTotal["total_cases"].string
                let newDeaths  = worldTotal["new_deaths"].string
                let updatedAt = worldTotal["statistic_taken_at"].string
                self.worldData = WorldData(confirmed: totalCases ?? "", death: totalDeaths ?? "", recoverd: totalRecovered ?? "", newCases: newCases ?? "", newDeaths: newDeaths ?? "",updatedAt: updatedAt ?? "")
                
                if  let countries = json["countries_stat"].array {
                    for country in  countries{
                        let countryName = country["country_name"].string
                        let cases = country["cases"].string
                        let deaths = country["deaths"].string
                        let totalRecovered = country["total_recovered"].string
                        let newDeaths = country["new_deaths"].string
                        let seriousCritical = country["serious_critical"].string
                        let newCases = country["new_cases"].string
                        let activeCases = country["active_cases"].string
                        let countryObject = CountryRecord(confirmed: cases ?? "", death: deaths ?? "", recoverd: totalRecovered ?? "", newCases: newCases ?? "", newDeaths: newDeaths ?? "", critical: seriousCritical ?? "", activeCases: activeCases ?? "", countryName: countryName ?? "")
                        allCount.append(countryObject)
                    }
                }
                self.delegate?.getWorldTotal(totalData: self.worldData!)
            }
            self.counriesData = allCount.sorted(by: { $0.confirmed > $1.confirmed})
            self.delegate?.getAllCountry(allCountries: self.counriesData)
        }
    }
    
    
}
