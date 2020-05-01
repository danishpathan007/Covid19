//
//  CovidFetchRequest.swift
//  COVID19 - Statics
//
//  Created by Danish Khan on 30/04/20.
//  Copyright © 2020 Danish Khan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol CovidFetchRequestDelegate {
    func getCurrentTotal(totalData:TotalData)
    func getAllCountry(allCountries:[CountryData])
}


class CovidFetchRequest: ObservableObject {
    @Published var allCountries:[CountryData] = [testCountryData]
    @Published var totalData:TotalData = testTotalData
    
    var delegate:CovidFetchRequestDelegate?
    
    let headers:HTTPHeaders = [
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
        "x-rapidapi-key": "32bbb74a57mshe6cf7502152a171p1babafjsn25bda0d8443e"
    ]
    
    init() {
        Loader.show()
        getAllCountry()
        getCurrentTotal()
    }
    
    
    func getCountryByName(with countyName:String){
        
        AF.request("https://covid-19-data.p.rapidapi.com/report/country/name",headers: headers).responseJSON { response in
            
            let result = response.data
            if result != nil{
                let json = JSON(result!)
                let confirmed  = json[0]["confirmed"].intValue
                let deaths  = json[0]["deaths"].intValue
                let recovered  = json[0]["recovered"].intValue
                let critical  = json[0]["critical"].intValue
                
                self.totalData = TotalData(confirmed: confirmed, critical: deaths, deaths: recovered, recovered: critical)
                self.delegate?.getCurrentTotal(totalData: self.totalData)
            }else{
                self.totalData = testTotalData
                self.delegate?.getCurrentTotal(totalData: self.totalData)
            }
        }

        
        
    }
    
    
    func getCurrentTotal() {
        
        
        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=json",headers: headers).responseJSON { response in
            
            let result = response.data
            if result != nil{
                let json = JSON(result!)
                let confirmed  = json[0]["confirmed"].intValue
                let deaths  = json[0]["deaths"].intValue
                let recovered  = json[0]["recovered"].intValue
                let critical  = json[0]["critical"].intValue
                
                self.totalData = TotalData(confirmed: confirmed, critical: deaths, deaths: recovered, recovered: critical)
                self.delegate?.getCurrentTotal(totalData: self.totalData)
            }else{
                self.totalData = testTotalData
                self.delegate?.getCurrentTotal(totalData: self.totalData)
            }
        }
    }
    
    func getAllCountry(){
        
        AF.request("https://covid-19-data.p.rapidapi.com/country/all?format=json",headers: headers).responseJSON { response in
            
            let result = response.value
            var allCount: [CountryData] = []
            
            if result != nil{
                let dataDictionary = result as! [Dictionary<String,AnyObject>]
                for countryData in dataDictionary{
                    let country = countryData["country"] as? String ?? "Error"
                    let langitude = countryData["langitude"] as? Double ?? 0.0
                    let latitude = countryData["latitude"] as? Double ?? 0.0
                    
                    let confirmed  = countryData["confirmed"] as? Int64 ?? 0
                    let deaths  = countryData["deaths"] as? Int64 ?? 0
                    let recovered  = countryData["recovered"] as? Int64 ?? 0
                    let critical  = countryData["critical"] as? Int64 ?? 0
                    
                    let countryObject = CountryData(country: country, confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered, longitude: langitude, latitude: latitude)
                    allCount.append(countryObject)
                }
            }
            self.allCountries = allCount.sorted(by: { $0.confirmed > $1.confirmed})
            self.delegate?.getAllCountry(allCountries: self.allCountries)
        }
        
    }
}
