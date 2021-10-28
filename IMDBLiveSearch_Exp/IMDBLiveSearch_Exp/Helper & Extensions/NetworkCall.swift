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
        var components = URLComponents()
        components.scheme = "http"
        components.host = "omdbapi.com"
        components.queryItems = [
            URLQueryItem(name: "s", value: searchTerm.trimmed()),
            URLQueryItem(name: "apikey", value: "3e07bca7")
            // c0574de1
            // 3e07bca7
        ]
        guard let url = components.url else {
            throw NetworkError.badURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.badID
        }
        let movieResponse = try? JSONDecoder().decode(Response?.self, from: data)
        //print(url)
        print(data)
        print(movieResponse?.movies ?? [])
        return movieResponse?.movies ?? []
    }
}
