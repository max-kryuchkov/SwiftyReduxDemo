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
                ProgressView().scaleEffect(2.0)
            case .presenting:
                if store.state.requestState.posts.isEmpty {
                    Button("Get Test Posts") {
                        store.dispatch(RequestActions.GetData().thunk())
                    }
                } else {
                    List(store.state.requestState.posts) { post in
                        VStack {
                            Text((post.title.prefix(60).trimmingCharacters(in: .whitespacesAndNewlines) + "...").capitalized)
                                .font(.title)
                            Spacer(minLength: 10.0)
                            Text(post.body.prefix(120).trimmingCharacters(in: .whitespacesAndNewlines) + "...")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.top, 5.0)
                        .padding(.bottom, 5.0)
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
