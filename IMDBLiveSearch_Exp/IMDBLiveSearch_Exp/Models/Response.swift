//
//  Movie.swift
//  IMDBLiveSearch_Exp
//
//  Created by Shak Feizi on 10/27/21.
//

import Foundation


struct Response {
    var movie: [Movie]
    
    enum NameKeys: String, CodingKey {
        case movie = "Search"
    }
}

struct Movie {
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
