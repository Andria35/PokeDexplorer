//
//  PokemonEntryModel.swift
//  PokeDexplorer
//
//  Created by Andria Inasaridze on 28.03.24.
//

import Foundation

struct PokemonEntryModel {
    
    var id: UUID = .init()
    let name: String
    let url: String
    
    var imageUrl: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(url.split(separator: "/").last ?? "1").png"
    }
}

struct PokemonResponse: Decodable {
    let count: Int?
    let results: [PokemonEntryResponse]?
}

struct PokemonEntryResponse: Decodable {
    let name: String?
    let url: String?
}
