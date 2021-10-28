//
//  Movie.swift
//  IMDBLiveSearch_Exp
//
//  Created by Shak Feizi on 10/27/21.
//

import Foundation


struct Response: Codable {
    var movies: [Movie]
    
    enum NameKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Codable {
    let title: String
    let type: String
    let imdbID: String
    let year: String
    let poster: String
    
    enum NameKeys: String, CodingKey {
        case title = "Title"
        case type = "Type"
        case imdbID = "imdbID"
        case year = "Year"
        case poster = "Poster"
    }
}
