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
    
    private func perform(request _request: URLRequest) async throws -> Data {
        let session = URLSession(configuration: .default)
        let (data, _) = try await session.data(for: _request)
        return data
    }
    
    func getTestDataUsingAsyncAwait() async -> Result<[Post], Error> {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else {
            return .failure(NetworkManagerError.invalidRequest)
        }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 100)
        request.httpMethod = "GET"
        
        do {
            let data = try await perform(request: request)
            let posts = try JSONDecoder().decode([Post].self, from: data)
            return .success(posts)
        } catch {
            return .failure(error)
        }
    }
    
    func getTestDataUsingCombine(completion: @escaping (Result<[Post], Error>) -> Void) {
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
            .sink(receiveCompletion: { result in
                switch result {
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
