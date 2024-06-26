//
//  PokemonRepositoryImpl.swift
//  PokeDexplorer
//
//  Created by Andria Inasaridze on 28.03.24.
//

import Foundation

struct PokemonRepositoryImpl {
    typealias PokemonInstance = (RemoteDataSource) -> PokemonRepositoryImpl
    
    fileprivate let remote: RemoteDataSource
    
    init(remote: RemoteDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: PokemonInstance = {  remoteRepo in
        return PokemonRepositoryImpl(remote: remoteRepo)
    }
}

extension PokemonRepositoryImpl: PokemonRepositoryProtocol {
    
    func getPokemons(offset: Int, limit: Int) async throws -> [PokemonEntryModel] {
        do {
            let data = try await remote.getPokemons(offset: offset, limit: limit)
            
            return PokemonMapper.mapPokemonsResponseToDomain(input: data.results ?? [])
        } catch {
            throw error
        }
    }
}
