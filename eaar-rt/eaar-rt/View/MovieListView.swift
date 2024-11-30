//
// MovieListView.swift
// eaar-rt
//
// Created by Elvis on 29/11/24.
//

import SwiftUI

struct MovieListView: View {
    @StateObject private var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.movies) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        HStack {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(movie.posterPath)")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 60, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            VStack(alignment: .leading) {
                                Text(movie.title).bold()
                                Text(movie.releaseDate).font(.caption)
                            }
                        }
                    }
                }
                
                if viewModel.canLoadMore {
                    Button("Cargar más") {
                        viewModel.fetchMovies()
                    }
                }
            }
            .onAppear {
                viewModel.fetchMovies()
            }
            .alert(isPresented: $viewModel.hasError) {
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
            }
            .navigationTitle("Películas")
        }
    }
}
