//
//  BluetoothServiceActions.swift
//  SwiftyReduxDemo
//
//  Created by max kryuchkov on 19.02.2022.
//

import SwiftyRedux

protocol ColorAction: Action {}

struct ColorActions {
    
    struct NextValue: ColorAction {}
    struct DidChangeValue: ColorAction {}
}
