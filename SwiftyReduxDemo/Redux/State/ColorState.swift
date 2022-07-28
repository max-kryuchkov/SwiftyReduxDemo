//
//  ColorState.swift
//  SwiftyReduxDemo
//
//  Created by max kryuchkov on 19.02.2022.
//

import SwiftyRedux

struct ColorState: State {
    let value: Int
    
    func updating(value: Int) -> Self {
        .init(value: value)
    }
    
    static var initial: Self {
        .init(value: 0)
    }
}
