//
//  RateRow.swift
//  NBPCurrencyRates
//
//  Created by Jacek Placek on 09/07/2022.
//

import SwiftUI

struct RateRow: View {
    let rate: CurrencyCRate
    var body: some View {
        NavigationLink {
            CurrencyDetail(rate:rate)
        } label: {
            HStack{
                Text(rate.id).font(.title)
                    .foregroundColor(Color("LightGreen"))
                    .background{
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .stroke(Color.white.opacity(0.2),lineWidth: 1)
                        
                    }
                Text(rate.currency).font(.callout)
                
                VStack(alignment: .trailing){
                    Text(String(format: "%.4f", rate.bid))
                        .foregroundColor(.red)
                        .background{
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .stroke(Color.white.opacity(0.2),lineWidth: 1)
                            
                        }
                    Text(String(format: "%.4f", rate.ask))
                        .foregroundColor(.green)
                        .background{
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .stroke(Color.white.opacity(0.2),lineWidth: 1)
                            
                        }
                }
                .padding()
                .font(.callout)
            }
        }    }
}

struct RateRow_Previews: PreviewProvider {
    static var previews: some View {
        RateRow(rate: .example)
            .preferredColorScheme(.dark)
    }
}
