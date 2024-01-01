//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Mario Luis on 1/1/24.
//

import Foundation

class NetworkManager {
    // we create the `NetworkManager` as a singleton
    static let shared = NetworkManager()
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], NetworkErrorMessage>) -> Void) {
        let endpoint = NetworkManagerConstants.baseUrl + "/\(username)/followers?per_page=\(NetworkManagerConstants.paginationNumber)&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidEndpoint))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // error handling
            if error != nil {
                completed(.failure(.invalidURLSession))
            }
            
            // response handling
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            // data handling
            guard let data else {
                completed(.failure(.invalidResponse))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidUsername))
            }
        }
        
        task.resume()
    }
    
    
    private enum NetworkManagerConstants {
        static let baseUrl = "https://api.github.com/users"
        static let paginationNumber = 100
    }
}





// ------- This is how we would do the data fetching prior to the introduction of the `Result` type ----------

//func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, NetworkErrorMessage?) -> Void) {
//    let endpoint = NetworkManagerConstants.baseUrl + "/\(username)/followers?per_page=\(NetworkManagerConstants.paginationNumber)&page=\(page)"
//    
//    guard let url = URL(string: endpoint) else {
//        completed(nil, .invalidEndpoint)
//        return
//    }
//    
//    let task = URLSession.shared.dataTask(with: url) { data, response, error in
//        // error handling
//        if error != nil {
//            completed(nil, .invalidURLSession)
//        }
//        
//        // response handling
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            completed(nil, .invalidResponse)
//            return
//        }
//        
//        // data handling
//        guard let data else {
//            completed(nil, .invalidResponse)
//            return
//        }
//        
//        do {
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            let followers = try decoder.decode([Follower].self, from: data)
//            completed(followers, nil)
//        } catch {
//            completed(nil, .invalidUsername)
//        }
//    }
//    
//    task.resume()
//}
