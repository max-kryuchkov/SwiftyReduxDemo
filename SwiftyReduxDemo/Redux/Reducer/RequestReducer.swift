//
//  RequestReducer.swift
//  SwiftyReduxDemo
//
//  Created by max on 27.07.2022.
//

import SwiftyRedux

extension Reducers {
    
    static func requestReducer(action: Action, requestState: RequestState?) -> RequestState {
        var state = requestState ?? .initial
        
        switch action {
        case _ as RequestActions.DidStart:
            state = state.updating(state: .loading)
        case let didFinish as RequestActions.DidFinish:
            state = state
                .updating(posts: didFinish.posts)
                .updating(state: .presenting)
        case let didFail as RequestActions.DidFail:
            state = state.updating(state: .error(didFail.error.localizedDescription))
        default:
            break
        }
        return state
    }
}
