//
//  ContentView.swift
//  SwiftyReduxDemo
//
//  Created by max kryuchkov on 25.07.2022.
//

import SwiftUI
import SwiftyRedux

struct ContentView: View {
    
    @EnvironmentObject private var store: Store<AppState>
    
    private let colors: [Color] = [.yellow, .gray, .indigo, .red, .mint, .green]
    
    var body: some View {
        TabView {
            ColorView()
            RequestView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Application.appStore)
    }
}
