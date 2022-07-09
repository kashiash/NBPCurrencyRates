//
//  DailyRatesModel.swift
//  NBPCurrencyRates
//
//  Created by Jacek Placek on 09/07/2022.
//

import Foundation



struct CurrencyCRate: Codable, Identifiable{
    var id: String
    var bid: Double
    var ask: Double
    var currency: String
    
    enum CodingKeys: String, CodingKey{
        case currency
        case bid
        case ask
        case id = "code"


    }
}

struct DailyCTable: Codable{

    var no: String
    var table: String
    var tradingDate: String
    var effectiveDate: String
    var rates: [CurrencyCRate]
    

}

// JSON URL
let url = URL(string: "https://api.nbp.pl/api/exchangerates/tables/C/")

