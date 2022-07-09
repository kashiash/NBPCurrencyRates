//
//  Home.swift
//  NBPCurrencyRates
//
//  Created by Jacek Placek on 09/07/2022.
//

import SwiftUI

struct Home: View {
    
    let currency = ["AUD","EUR","USD","GBP","JPY","CZK"]
   // @State private var table = [CurrencyModel]()
  //  @State var currentTable: CurrencyModel = CurrencyModel()
    @Namespace var animation
    @State var currentCurrency: String = "EUR"
    @StateObject var appModel:    AppViewModel = AppViewModel()
    var body: some View {
        
        VStack{
           if let table = appModel.currentTable
                , let rates = appModel.currentTable?.rates
            {
//           // CustomControl()
                VStack(alignment: .leading, spacing: 5) {
                    Text(table.effectiveDate)
                        .font(.callout)
//                    Text(table.table.uppercased())
//                        .font(.caption)
//                        .foregroundColor(.gray)
                }
                List(rates){ bankRate in
                    HStack(spacing: 15){
                        Text(bankRate.id)



                        Text(String(format: "%.2f", bankRate.bid))
                        Text(String(format: "%.2f", bankRate.ask))

                }
            }
               
               // .task(downloadCurrencyTable)
           } else {
            Text("Jakiś fakap")
           }
        }
        
        .padding()
        .navigationTitle("NBP rates")

    }
//    @Sendable func downloadCurrencyTable() async {
//        do {
//            let urlC = URL(string: "http://api.nbp.pl/api/exchangerates/tables/C/")
//            let url = URL(string: "https://api.nbp.pl/api/exchangerates/rates/A/\(currentCurrency)/last/100")!
//            let (data, _) = try await URLSession.shared.data(from: urlC)
//
//            let decoder = JSONDecoder()
//            decoder.dateDecodingStrategy = .iso8601
//
//           let tableTmp = try decoder.decode(CurrencyModel.self, from: data)
//           table.append(tableTmp)
//            currentTable = tableTmp
//        } catch {
//            print(error.localizedDescription)
//        }
//
//    }
    
    
//    @ViewBuilder
//    func CustomControl()->some View{
//        let currency = ["PLN","EUR","USD","GBP"]
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 15){
//                ForEach(currency, id: \.self){ item in
//                    Text(item)
//                        .padding(.vertical,6)
//                        .padding(.horizontal,10)
//                        .contentShape(Rectangle())
//                        .background{
//                            if currentCurrency == item{
//                                Rectangle()
//                                    .fill(Color("Tab"))
//                                    .matchedGeometryEffect(id: "SEGMENTEDTAB", in: animation)
//                            }
//                        }
//                        .onTapGesture{
//                            withAnimation{currentCurrency = item}
//
//                        }.task(downloadCurrencyTable
//                        )
//                }
//            }
//
//        }
//        .background{
//            RoundedRectangle(cornerRadius: 5, style: .continuous)
//                .stroke(Color.white.opacity(0.2),lineWidth: 1)
//        }
//        .padding(.vertical)
//
//    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
