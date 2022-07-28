//
//  AppReducers.swift
//  SwiftyReduxDemo
//
//  Created by max kryuchkov on 25.07.2022.
//

import SwiftyRedux

enum Reducers: AppReducers {
    typealias S = AppState
    
    static func appReducer(action: Action, state: S?) -> S {
        AppState(colorState: Reducers.colorReducer(action: action, colorState: state?.colorState),
                 requestState: Reducers.requestReducer(action: action, requestState: state?.requestState))
    }
}
