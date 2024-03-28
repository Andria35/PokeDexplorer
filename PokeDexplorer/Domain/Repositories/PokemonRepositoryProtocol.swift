//
//  PokemonRepositoryProtocol.swift
//  PokeDexplorer
//
//  Created by Andria Inasaridze on 28.03.24.
//

import Foundation

protocol PokemonRepositoryProtocol {
    func getPokemons(offset: Int, limit: Int) async throws -> [PokemonEntryModel]
}
