//
//  ColorReducer.swift
//  SwiftyReduxDemo
//
//  Created by max kryuchkov on 19.02.2022.
//

import SwiftyRedux

extension Reducers {
    
    static func colorReducer(action: Action, colorState: ColorState?) -> ColorState {
        var state = colorState ?? .initial
        
        switch action {
        case _ as ColorActions.NextValue:
            state = state.updating(value: state.value + 1)
        case _ as ColorActions.DidChangeValue:
            break
        default:
            break
        }
        return state
    }
}
