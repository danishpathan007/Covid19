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
