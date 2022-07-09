//
//  SelectSomethingView.swift
//  NBPCurrencyRates
//
//  Created by Jacek Placek on 09/07/2022.
//

import SwiftUI

struct SelectSomethingView: View {
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: "newspaper")
                .font(.largeTitle)
                .foregroundColor(.accentColor)
            Text("Kursy walut od jaszczompia")
                .font(.title)
            Text("Dopiero się uczę więc proszę o wyrozumiałość")
                .padding()
        }
       // .preferredColorScheme(.dark)
    }
}

struct SelectSomethingView_Previews: PreviewProvider {
    static var previews: some View {
        SelectSomethingView()
    }
}
