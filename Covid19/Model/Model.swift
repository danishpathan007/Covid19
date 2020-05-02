//
//  Model.swift
//  COVID19 - Statics
//
//  Created by Danish Khan on 30/04/20.
//  Copyright © 2020 Danish Khan. All rights reserved.
//

import Foundation

struct TotalData {
    var confirmed:Int
    var critical:Int
    var deaths:Int
    var recovered:Int
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    
    var recoverRate: Double {
        return (100.00 * Double(recovered)) / Double(confirmed)
    }
}

struct CountryData {
    var country: String
    var confirmed:Int64
    var critical:Int64
    var deaths:Int64
    var recovered:Int64
    var longitude:Double
    var latitude:Double
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    
    var recoverRate: Double {
        return (100.00 * Double(recovered)) / Double(confirmed)
    }
}

let testTotalData = TotalData(confirmed: 200, critical: 100, deaths: 20, recovered: 50)
let testCountryData = CountryData(country: "Test", confirmed: 500, critical: 100, deaths: 200, recovered: 100, longitude: 0.0, latitude: 0.0)


class WorldData{
      var totalConfirmed:String = ""
      var totalDeaths:String = ""
      var totalRecovered:String = ""
      var newCases:String = ""
      var newDeaths:String = ""
    var updatedAt:String = ""
    
    init(confirmed:String,death:String,recoverd:String,newCases:String,newDeaths:String,updatedAt:String) {
        self.newCases  = newCases
        self.totalDeaths = death
        self.totalRecovered = recoverd
        self.newDeaths = newDeaths
        self.totalConfirmed = confirmed
        self.updatedAt = updatedAt
    }
      
//      var fatalityRate: Double {
//          return (100.00 * Double(totalDeaths)) / Double(totalConfirmed)
//      }
//
//      var recoverRate: Double {
//          return (100.00 * Double(totalRecovered)) / Double(totalConfirmed)
//      }
}

struct CountryRecord {
    var countryName: String = ""
    var confirmed:String = ""
    var critical:String = ""
    var deaths:String = ""
    var recovered:String = ""
    var activeCases:String = ""
    var newDeaths:String = ""
    var newCases:String = ""
    
 
    
    init(confirmed:String,death:String,recoverd:String,newCases:String,newDeaths:String,critical:String,activeCases:String,countryName:String) {
           self.newCases  = newCases
           self.deaths = death
           self.recovered = recoverd
           self.newDeaths = newDeaths
           self.confirmed = confirmed
           self.countryName = countryName
           self.activeCases = activeCases
           self.critical = critical
       }
}


struct IndiaRecord {
    var confirmed:String = ""
    var deaths:String = ""
    var recovered:String = ""
    var active:String = ""
    var updatedAt:String = ""
    
 
    
    init(confirmed:String,death:String,recoverd:String,active:String,updatedAt:String) {
           self.deaths = death
           self.recovered = recoverd
           self.confirmed = confirmed
           self.active = active
           self.updatedAt = updatedAt
       }
  
}





extension String {
    var numberValue:NSNumber? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: self)
    }
}
