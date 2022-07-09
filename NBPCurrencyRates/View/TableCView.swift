//
//  TableCView.swift
//  NBPCurrencyRates
//
//  Created by Jacek Placek on 09/07/2022.
//

import SwiftUI

struct TableCView: View {
    @State private var tables = [DailyCTable]()
    @State private var rates = [CurrencyCRate]()
    @State private var loadState = LoadState.loading
    
    enum LoadState {
        case loading, success, failed
    }
    
    
    
    
    var body: some View {
        
        Group{
            switch loadState {
            case .loading:
                VStack{
                    Text("Pobieram dane ...")
                    ProgressView()
                }
            case .success:
                List(rates) { rate in
                    RateRow(rate: rate)
                }
            case .failed:
                VStack {
                    Text("Coś poszło nie tak ...")
                    Button("Załaduj ponownie") {
                        loadState = .loading
                        Task{
                            await downloadCurrencyTable()
                        }
                    }
                }
            }
        }
        
        
        .navigationTitle("Kusy Walut NBP")
        .task(downloadCurrencyTable)
        .refreshable(action: downloadCurrencyTable)
        
    }
    
    
    
    @Sendable func downloadCurrencyTable() async {
        do {
            let url = URL(string: "https://api.nbp.pl/api/exchangerates/tables/C")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            tables = try decoder.decode([DailyCTable].self, from: data)
            if tables.count > 0 {
                let table = tables[0]
                rates = table.rates
            }
            loadState = .success
        } catch {
            print(error.localizedDescription)
            loadState = .failed
        }
        
    }
    
}

struct TableCView_Previews: PreviewProvider {
    static var previews: some View {
        let example = DailyCTable.example
        //TODO: dostarczyc dane
        ContentView()
    }
}
