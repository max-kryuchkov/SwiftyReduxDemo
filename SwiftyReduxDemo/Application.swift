//
//  Application.swift
//  SwiftyReduxDemo
//
//  Created by max kryuchkov on 25.07.2022.
//

import SwiftyRedux
import Foundation

enum Application {
    
    static let networkManager = NetworkManager()
    static let appStore = Store(state: AppState(),
                                reducer: Reducers.appReducer,
                                middleware: [MiddlewareFactory.createThunkMiddleware(),
                                             MiddlewareFactory.createLoginMiddleware()])
}
