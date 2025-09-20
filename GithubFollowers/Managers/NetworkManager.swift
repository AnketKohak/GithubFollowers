//
//  NetworkManager.swift
//  GithubFollowers
//
//  Created by Anket Kohak on 18/09/25.
//

import Foundation


class NetworkManager{
    
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    
    func getFollowers(for username:String, page:Int, completed: @escaping([Follower]?,ErrorMessage?) ->Void){
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else{
            completed(nil, .invalid)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(nil, .invalidData)
                return
            }
            guard let response = response as? HTTPURLResponse,response.statusCode == 200 else{
                completed(nil, .invalidResponse)
                return
            }
            guard let data = data else{
                completed(nil, .unableToComplete)
                return
            }
        
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            }
            catch{
                completed(nil, .unableToComplete)
            }
            //3:40
        }
        
        task.resume()
    }
}
