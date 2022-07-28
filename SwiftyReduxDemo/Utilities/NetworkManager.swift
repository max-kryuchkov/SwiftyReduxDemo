//
//  NetworkManager.swift
//  SwiftyReduxDemo
//
//  Created by max on 27.07.2022.
//

import Foundation
import Combine

final class NetworkManager {
    
    private var cancellables = Set<AnyCancellable>()
    
    func getTestData(completion: @escaping (Result<[Post], Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        
        guard let requestURL = URL(string: urlString) else {
            completion(.failure(NetworkManagerError.invalidRequest))
            return
        }
        URLSession.shared.dataTaskPublisher(for: requestURL)
            .receive(on: DispatchQueue.main)
            .tryMap({ (data, response) -> Data in
                guard let response = response as? HTTPURLResponse, response.statusCode >= 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            })
            .decode(type: [Post].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { asd in
                switch asd {
                case.failure(let error):
                    completion(.failure(error))
                case .finished:
                    break
                }
            }, receiveValue: { posts in
                completion(.success(posts))
            })
            .store(in: &cancellables)
    }
}

struct Post: Identifiable, Decodable {
    let id: Int
    let title: String
    let body: String
}
