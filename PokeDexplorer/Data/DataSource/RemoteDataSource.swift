//
//  RemoteDataSource.swift
//  PokeDexplorer
//
//  Created by Andria Inasaridze on 28.03.24.
//

import Foundation

protocol RemoteDataSourceProtocol {
    func getPokemons(offset: Int, limit: Int) async throws -> PokemonResponse
}

struct RemoteDataSource {
    private init() {}
    
    static let shared: RemoteDataSource = RemoteDataSource()
}


extension RemoteDataSource: RemoteDataSourceProtocol {
    
    func getPokemons(offset: Int, limit: Int) async throws -> PokemonResponse {
//            guard let url = URL(string: Endpoints.Gets.pokemons(offset: offset, limit: limit).url) else {throw URLError.invalidURL}
//            
//            let (data, response) = try await URLSession.shared.data(from: url)
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                throw URLError.invalidResponse
//            }
//            
//            do {
//                return try JSONDecoder().decode(PokemonResponse.self, from: data)
//            } catch {
//                throw URLError.parsingError
//            }
        return PokemonResponse(count: nil, results: nil)
        }
    
}
