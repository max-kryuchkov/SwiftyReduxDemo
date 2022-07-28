//
//  ColorView.swift
//  SwiftyReduxDemo
//
//  Created by max kryuchkov on 27.07.2022.
//

import SwiftUI
import SwiftyRedux

struct ColorView: View {
    
    @EnvironmentObject private var store: Store<AppState>
    
    private let colors: [Color] = [.yellow, .gray, .indigo, .red, .mint, .green]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
            }
            Spacer()
            Text("Hello, this is SwiftyRedux demo!").padding(.bottom, 20)
            Button("Next") {
                store.dispatch(ColorActions.NextValue())
            }
            Spacer()
        }
        .background(colors[store.state.colorState.value % colors.count])
        .tabItem {
            Label("Colors", systemImage: "list.dash")
        }
    }
}
