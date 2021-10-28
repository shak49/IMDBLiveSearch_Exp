//
//  NetworkCall.swift
//  IMDBLiveSearch_Exp
//
//  Created by Shak Feizi on 10/27/21.
//

import Foundation


class NetworkCall {
    // SHAK: Functions
    func fetchMovies(searchTerm: String) async throws -> [Movie] {
        var component = URLComponents()
        component.scheme = "http"
        component.host = "omdbapi.com"
        component.queryItems = [
            URLQueryItem(name: "s", value: searchTerm),
            URLQueryItem(name: "apikey", value: "3e07bca7")
        ]
        guard let url = component.url else {
            throw NetworkError.badURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.badID
        }
        let responseLevel = try? JSONDecoder().decode(Response.self, from: data)
        return responseLevel?.movies ?? []
    }
}
