//
//  SwiftyReduxDemoApp.swift
//  SwiftyReduxDemo
//
//  Created by max kryuchkov on 25.07.2022.
//

import SwiftUI

@main
struct SwiftyReduxDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Application.appStore)
        }
    }
}
