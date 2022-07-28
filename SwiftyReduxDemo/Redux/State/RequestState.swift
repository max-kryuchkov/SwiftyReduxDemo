//
//  RequestState.swift
//  SwiftyReduxDemo
//
//  Created by max on 27.07.2022.
//

import SwiftyRedux

struct RequestState: State {
    let posts: [Post]
    let state: ViewState
    
    func updating(posts: [Post]) -> Self {
        .init(posts: posts, state: self.state)
    }
    
    func updating(state: ViewState) -> Self {
        .init(posts: self.posts, state: state)
    }
    
    static var initial: Self {
        .init(posts: [], state: .presenting)
    }
    
    static func == (lhs: RequestState, rhs: RequestState) -> Bool {
        lhs.posts.count == rhs.posts.count && lhs.posts.enumerated().allSatisfy({ (index, item) in
            item.id == rhs.posts[index].id
        })
    }
}
