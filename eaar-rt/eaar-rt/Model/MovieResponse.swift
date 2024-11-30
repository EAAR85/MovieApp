//
// MovieResponse.swift
// eaar-rt
//
// Created by Elvis on 29/11/24.
//


import Foundation

struct MovieResponse: Codable {
    let dates: Dates
    let page: Int
    let results: [Movie]
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case dates, page, results, totalResults = "total_results"
    }
}

struct Dates: Codable {
    let maximum: String
    let minimum: String
}

struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let posterPath: String
    let voteAverage: Double
    let releaseDate: String
    let overview: String

    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
    }
}
