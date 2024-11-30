//
// MovieDetailView.swift
// eaar-rt
//
// Created by Elvis on 29/11/24.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 120, height: 200)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 200)
                            .cornerRadius(8)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 200)
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                Text(movie.title)
                    .font(.title)
                    .bold()
                
                Text("Rating: \(movie.voteAverage, specifier: "%.1f")")
                    .font(.subheadline)
                
                Text("Release Date: \(movie.releaseDate ?? "Unknown")")
                    .font(.subheadline)
                
                Text(movie.overview)
                    .font(.body)
                    .lineLimit(nil)
            }
            .padding()
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
