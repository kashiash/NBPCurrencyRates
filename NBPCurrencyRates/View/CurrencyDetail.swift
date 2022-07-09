//
//  CurrencyDetail.swift
//  NBPCurrencyRates
//
//  Created by Jacek Placek on 09/07/2022.
//

import SwiftUI

struct CurrencyDetail: View {
    let rate: CurrencyCRate
   // @State private var tables = [CurrencyCTable]()
   @State private var rates = [CurrencyDailyCRate]()
    
    
    enum LoadState {
        case loading, success, failed
    }
    
    @State private var loadState = LoadState.loading
    
    
    var body: some View {
        HStack{
        Text("TEST")
        
        Group{
            switch loadState {
            case .loading:
                VStack{
                    Text("Pobieram dane ...")
                    ProgressView()
                }
            case .success:
                List(rates) { item in
                    HStack{
                        Text(item.effectiveDate)

                        VStack(alignment: .trailing){
                            Text(String(format: "%.4f", item.bid))
                                .foregroundColor(.red)
                                .background{
                                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                                        .stroke(Color.white.opacity(0.2),lineWidth: 1)

                                }
                            Text(String(format: "%.4f", item.ask))
                                .foregroundColor(.green)
                                .background{
                                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                                        .stroke(Color.white.opacity(0.2),lineWidth: 1)

                                }
                        }
                    }
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
        .navigationTitle("Kursy historyczne")
        .task(downloadCurrencyTable)
    }
    
    }
    
    
    @Sendable func downloadCurrencyTable() async {
        do {
            let url = URL(string: "https://api.nbp.pl/api/exchangerates/rates/C/\(rate.id)/last/100")!
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
           let table = try decoder.decode(CurrencyCTable.self, from: data)
         
       
               rates = table.rates
          
            loadState = .success
        } catch {
            print(error.localizedDescription)
            loadState = .failed
        }
        
    }
}

struct CurrencyDetail_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyDetail(rate: .example)
    }
}
