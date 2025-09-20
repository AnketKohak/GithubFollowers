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
    
    func getFollowers(for username:String, page:Int, completed: @escaping([Follower]?,String?) ->Void){
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else{
            completed(nil,"this username created an invalid request.Please try again")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(nil,"Unable to complete your request. please check your internet connection")
                return
            }
            guard let response = response as? HTTPURLResponse,response.statusCode == 200 else{
                completed(nil,"Invalid responce from the server.please try again later")
                return
            }
            guard let data = data else{
                completed(nil,"the data recived from the server was invalid.please try again later")
                return
            }
        
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            }
            catch{
                completed(nil, "the data recived from the server was invalid.please try again later")
            }
            //3:40
        }
        
        task.resume()
    }
}
