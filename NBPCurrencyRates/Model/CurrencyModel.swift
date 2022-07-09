//
//  CurrencyModel.swift
//  NBPCurrencyRates
//
//  Created by Jacek Placek on 09/07/2022.
//

import Foundation

struct CurrencyRate: Codable,Identifiable{
    var id: String
  //  var date: String?
  //  var mid: Double?
    var bid: Double?
    var ask: Double?
    
    enum CodingKeys: String,CodingKey{
    //    case mid
        case bid
        case ask
        case id = "code"
     //   case date = "effectiveDate"

    }
}

struct CurrencyModel: Codable{

    var currency: String
    var table: String
    var code: String
    var tradingDate: String?
    var effectiveDate: String?
    var rates: [CurrencyRate]
}

// JSON URL

let urlA = URL(string: "http://api.nbp.pl/api/exchangerates/tables/C/")
let urlB = URL(string: "http://api.nbp.pl/api/exchangerates/tables/C/")
let urlX = URL(string: "http://api.nbp.pl/api/exchangerates/rates/A/USD/last/100")
//{
//    "table": "A",
//    "currency": "dolar amerykański",
//    "code": "USD",
//    "rates": [
//        {
//            "no": "032/A/NBP/2022",
//            "effectiveDate": "2022-02-16",
//            "mid": 3.9478
//        },
//        {
//            "no": "033/A/NBP/2022",
//            "effectiveDate": "2022-02-17",
//            "mid": 3.9687
//        }]
//}
