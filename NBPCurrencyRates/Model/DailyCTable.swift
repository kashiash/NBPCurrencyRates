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
    static let example = CurrencyCRate(id: "EUR", bid: 4.6579, ask: 4.7519, currency: "euro radzieckie")
}

struct DailyCTable: Codable{

    var no: String
    var table: String
    var tradingDate: String
    var effectiveDate: String
    var rates: [CurrencyCRate]
    
    static let example = DailyCTable(no: "131/C/NBP/2022", table: "C", tradingDate: "2022-07-07", effectiveDate: "2022-07-08", rates: [CurrencyCRate.example])
}



