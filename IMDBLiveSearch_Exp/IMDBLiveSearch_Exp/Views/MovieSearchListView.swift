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
                HStack {
                    AsyncImage(url: movie.poster, content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100)
                    }, placeholder: {
                        ProgressView()
                    })
                    Text(movie.title)
                }
            }
            .listStyle(.plain)
            .searchable(text: $searchTerm)
            .onChange(of: searchTerm) { value in
                async {
                    await movieListVM.search(term: value)
                    if !value.isEmpty && value.count > 3 {
                    } else {
                        movieListVM.movies.removeAll()
                    }
                }
            }
            .navigationTitle("Movies")
        }
    }
}

struct MovieSearchListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchListView()
    }
}
