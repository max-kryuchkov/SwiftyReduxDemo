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
    
    var body: some View {
        TabView {
            RequestView()
            ColorView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Application.appStore)
    }
}
