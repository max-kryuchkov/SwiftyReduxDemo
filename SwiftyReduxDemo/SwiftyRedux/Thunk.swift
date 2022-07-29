//
//  Thunk.swift
//  SwiftyRedux
//
//  Created by max kryuchkov on 27.04.2021.
//

import Foundation

open class Thunk<S>: Action {
    
    public let body: (_ dispatch: @escaping DispatchFunction, _ getState: @escaping () -> S?) -> Void
    
    public init(body: @escaping (_ dispatch: @escaping DispatchFunction, _ getState: @escaping () -> S?) -> Void) {
        self.body = body
    }
}
