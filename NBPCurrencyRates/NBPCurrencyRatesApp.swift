//
//  NBPCurrencyRatesApp.swift
//  NBPCurrencyRates
//
//  Created by Jacek Placek on 09/07/2022.
//

import SwiftUI

@main
struct NBPCurrencyRatesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
                SelectSomethingView()
            }
        }
    }
}
