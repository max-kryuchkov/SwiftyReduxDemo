//
//  RequestAction.swift
//  SwiftyReduxDemo
//
//  Created by max on 27.07.2022.
//

import SwiftyRedux

protocol RequestAction: Action {}

struct RequestActions {
    
    struct GetData: RequestAction {
        
        func thunk() -> Thunk<AppState> {
            return Thunk { dispatch, getState in
                guard let _ = getState() else {
                    return
                }
                dispatch(DidStart())
                Application.networkManager.getTestData { result in
                    switch result {
                    case .success(let posts):
                        dispatch(DidFinish(posts: posts))
                    case .failure(let error):
                        dispatch(DidFail(error: error))
                    }
                }
            }
        }
    }
    
    struct DidStart: RequestAction {}
    struct DidFinish: RequestAction {
        let posts: [Post]
    }
    struct DidFail: RequestAction {
        let error: Error
    }
}
