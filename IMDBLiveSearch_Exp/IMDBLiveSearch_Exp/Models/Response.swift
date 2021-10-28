//
//  Movie.swift
//  IMDBLiveSearch_Exp
//
//  Created by Shak Feizi on 10/27/21.
//

import Foundation


struct Response: Codable {
    var movies: [Movie]
    
    private enum NameKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Codable {
    let imdbId: String
    let title: String
    let poster: String
    
    private enum NameKeys: String, CodingKey {
        case imdbId = "imdbID"
        case title = "Title"
        case poster = "Poster"
    }
}
