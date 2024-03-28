//
//  PokemonMapper.swift
//  PokeDexplorer
//
//  Created by Andria Inasaridze on 28.03.24.
//

import Foundation

enum PokemonMapper {
    static func mapPokemonsResponseToDomain(input response: [PokemonEntryResponse]) -> [PokemonEntryModel] {
        return response.map { result in
            return PokemonEntryModel(
                name: result.name ?? "Unknown",
                url: result.url ?? "Unknown"
            )
        }
    }
}
