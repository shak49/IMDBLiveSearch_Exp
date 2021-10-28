//
//  MovieListViewModel.swift
//  IMDBLiveSearch_Exp
//
//  Created by Shak Feizi on 10/27/21.
//

import Foundation


@MainActor
class MovieListViewModel: ObservableObject {
    // SHAK: Properties
    @Published var movies: [MovieViewModel] = []
    
    // SHAK: Functions
    func search(term: String) async {
        do {
            let searchResult = try await NetworkCall().fetchMovies(searchTerm: term)
            self.movies = searchResult.map(MovieViewModel.init)
        } catch {
            print(error)
        }
    }
}

struct MovieViewModel {
    // SHAK: Properties
    let movie: Movie
    var imdbId: String {
        movie.imdbId
    }
    var title: String {
        movie.title
    }
    var poster: URL? {
        URL(string: movie.poster)
    }
}





