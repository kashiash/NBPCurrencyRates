//
//  CurrencyCRates.swift
//  NBPCurrencyRates
//
//  Created by Jacek Placek on 09/07/2022.
//

import Foundation

struct CurrencyDailyCRate: Codable, Identifiable{
    var id: String
    var bid: Double
    var ask: Double
    var effectiveDate: String
   
    
    enum CodingKeys: String, CodingKey{
        case effectiveDate
        case bid
        case ask
        case id = "no"


    }
    static let example = CurrencyDailyCRate(id: "131/C/NBP/2022", bid: 4.6579, ask: 4.7519, effectiveDate: "2022-07-08")
}

struct CurrencyCTable: Codable{

    var code: String
    var table: String
    var currency: String

    var rates: [CurrencyDailyCRate]
    
    static let example = CurrencyCTable(code: "EUR", table: "C", currency: "euro radzieckie" ,  rates: [CurrencyDailyCRate.example,CurrencyDailyCRate.example])
}
