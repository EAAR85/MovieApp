//
// MovieService.swift
// eaar-rt
//
// Created by Elvis on 29/11/24.
//


import Foundation

class MovieService {
    static let shared = MovieService()
    private let apiKey = "f46b58478f489737ad5a4651a4b25079"
    private let baseURL = "https://api.themoviedb.org/3/movie/upcoming"
    
    private init() {}
    
    func fetchMovies(page: Int, completion: @escaping (Result<MovieResponse, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)?page=\(page)&api_key=\(apiKey)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                }
                return
            }
            
            do {
                let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(movieResponse))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
