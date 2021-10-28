//
//  MovieSearchListView.swift
//  IMDBLiveSearch_Exp
//
//  Created by Shak Feizi on 10/28/21.
//

import SwiftUI

struct MovieSearchListView: View {
    // SHAK: Properties
    @StateObject private var movieListVM = MovieListViewModel()
    @State private var searchTerm: String = ""
    
    var body: some View {
        NavigationView {
            List(movieListVM.movies, id: \.imdbID) { movie in
                Text(movie.title)
            }
            .listStyle(.plain)
            .searchable(text: $searchTerm)
        }
    }
}

struct MovieSearchListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchListView()
    }
}
