//
//  Application.swift
//  SwiftyReduxDemo
//
//  Created by max kryuchkov on 25.07.2022.
//

import SwiftyRedux

enum Application {
    static let appStore = Store(state: AppState(),
                                reducer: Reducers.appReducer,
                                middleware: [MiddlewareFactory.createThunkMiddleware(),
                                             MiddlewareFactory.createLoginMiddleware()])
}
