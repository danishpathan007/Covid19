//
//  IndiaDataFetchRequest.swift
//  Covid19
//
//  Created by Danish Khan on 02/05/20.
//  Copyright © 2020 Danish Khan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol IndiaDataFetchRequestDelegate {
    func getIndiaTotal(totalData:IndiaRecord)
   // func getAllCountry(allCountries:[CountryRecord])
}


class IndiaDataFetchRequest: ObservableObject {
        
    var indiaData:IndiaRecord?
    var counriesData:[CountryRecord] = []
    var delegate:IndiaDataFetchRequestDelegate?
    
    let headers:HTTPHeaders = [
        "x-rapidapi-host": "corona-virus-world-and-india-data.p.rapidapi.com",
        "x-rapidapi-key": "32bbb74a57mshe6cf7502152a171p1babafjsn25bda0d8443e"
    ]
        
    init() {
        Loader.show()
        getIndiaTotal()
    }
        
    
    func getIndiaTotal() {
        AF.request("https://corona-virus-world-and-india-data.p.rapidapi.com/api_india",headers: headers).responseJSON { response in
            let result = response.data
           // var allCount: [CountryRecord] = []
            
            if result != nil{
                let json = JSON(result!)
                let worldTotal  = json["total_values"]
                let deaths  = worldTotal["deaths"].string
                let recovered  = worldTotal["recovered"].string
                let confirmed  = worldTotal["confirmed"].string
                let active  = worldTotal["active"].string
                let updatedAt = worldTotal["lastupdatedtime"].string
                self.indiaData = IndiaRecord(confirmed: confirmed ?? "", death: deaths ?? "", recoverd: recovered ?? "", active:  active ?? "",updatedAt: updatedAt ?? "")
                
//                if  let india = json["state_wise"].dictionary {
//                    for (_,value) in  india.enumerated(){
//                        let state = india[value.key]
//
//                        let confirmed = state?["confirmed"].string
////                        let countryName = country["country_name"].string
////                        let cases = country["cases"].string
////                        let deaths = country["deaths"].string
////                        let totalRecovered = country["total_recovered"].string
////                        let newDeaths = country["new_deaths"].string
////                        let seriousCritical = country["serious_critical"].string
////                        let newCases = country["new_cases"].string
////                        let activeCases = country["active_cases"].string
////                        let countryObject = CountryRecord(confirmed: cases ?? "", death: deaths ?? "", recoverd: totalRecovered ?? "", newCases: newCases ?? "", newDeaths: newDeaths ?? "", critical: seriousCritical ?? "", activeCases: activeCases ?? "", countryName: countryName ?? "")
////                        allCount.append(countryObject)
//                    }
//                }
                self.delegate?.getIndiaTotal(totalData: self.indiaData!)
            }
           // self.counriesData = allCount.sorted(by: { $0.confirmed > $1.confirmed})
           // self.delegate?.getAllCountry(allCountries: self.counriesData)
        }
    }
}
