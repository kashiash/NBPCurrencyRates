//
//  AppViewModel.swift
//  NBPCurrencyRates
//
//  Created by Jacek Placek on 09/07/2022.
//

import Foundation
class AppViewModel: ObservableObject {
    @Published var currencyTables: [DailyCTable]?
    @Published var currentTable: DailyCTable?
    @Published var currentCurrency: String = "EUR"

    init(){
        Task{
            do{
                try await fetchNbpData()
            } catch{
                print("Dupa zbita \(error.localizedDescription)")
            }
        }
    }

    func fetchNbpData() async throws{
        guard let url = url else {return}
        let session = URLSession.shared
        let response = try await session.data(from:url)
        let jsonData = try JSONDecoder().decode([DailyCTable].self, from: response.0)

        await MainActor.run(body: {
            let table = jsonData
          

           self.currencyTables = table
            self.currentTable = table[0]
        })

    }

}



