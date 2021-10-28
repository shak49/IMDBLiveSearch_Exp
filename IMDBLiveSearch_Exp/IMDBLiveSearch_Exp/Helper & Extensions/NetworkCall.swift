//
//  NetworkCall.swift
//  IMDBLiveSearch_Exp
//
//  Created by Shak Feizi on 10/27/21.
//

import Foundation


class NetworkCall {
    
    func fetchMovies(searchTerm: String) async throws -> [Movie] {
        var urlComponent = URLComponents()
        urlComponent.scheme = "http"
        urlComponent.host = "omdbapi.com"
        urlComponent.queryItems = [
            URLQueryItem(name: "s", value: searchTerm),
            URLQueryItem(name: "apikey", value: "3e07bca7")
        ]
        return []
    }
}
