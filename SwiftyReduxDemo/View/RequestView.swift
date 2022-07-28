//
//  RequestView.swift
//  SwiftyReduxDemo
//
//  Created by max kryuchkov on 27.07.2022.
//

import SwiftUI
import SwiftyRedux

struct RequestView: View {
    
    @EnvironmentObject private var store: Store<AppState>
    
    var body: some View {
        VStack {
            Spacer()
            switch store.state.requestState.state {
            case .loading:
                Text("Loading...")
            case .presenting:
                if store.state.requestState.posts.isEmpty {
                    Button("Get Test Posts") {
                        store.dispatch(RequestActions.GetData().thunk())
                    }
                } else {
                    List(store.state.requestState.posts) { post in
                        Text(post.title)
                    }
                }
            case .error(let message):
                Text("Error: \(message)")
            }
            Spacer()
        }
        .tabItem {
            Label("Posts", systemImage: "magazine")
        }
    }
}
