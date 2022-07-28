//
//  AppState.swift
//  SwiftyReduxDemo
//
//  Created by max kryuchkov on 25.07.2022.
//

import SwiftyRedux

struct AppState: State {
    
    private(set) var colorState: ColorState
    private(set) var requestState: RequestState
    
    init(colorState: ColorState = .initial, requestState: RequestState = .initial) {
        self.colorState = colorState
        self.requestState = requestState
    }
}
