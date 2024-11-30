//
// MovieListViewModel.swift
// eaar-rt
//
// Created by Elvis on 29/11/24.
//


import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var currentPage = 1
    @Published var canLoadMore = true
    @Published var hasError = false
    @Published var errorMessage = ""
    private var totalResults = 0
    
    func fetchMovies() {
        MovieService.shared.fetchMovies(page: currentPage) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.movies.append(contentsOf: response.results)
                self.totalResults = response.totalResults
                self.currentPage += 1
                self.canLoadMore = self.movies.count < self.totalResults
                
            case .failure(let error):
                self.hasError = true
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
