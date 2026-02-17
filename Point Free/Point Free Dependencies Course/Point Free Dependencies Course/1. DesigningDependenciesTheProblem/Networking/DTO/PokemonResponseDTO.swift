//
//  PokemonResponseDTO.swift
//  Point Free Dependencies Course
//
//  Created by Henrique Capelatto Jordão on 17/02/26.
//

import Foundation

struct PokemonResponseDTO: Decodable {
    let results: [PokemonEntry]
    
    struct PokemonEntry: Decodable {
        let name: String
        let url: String
    }
}

extension PokemonEntry {
    static func mapToDomain(from dto: PokemonResponseDTO) -> [Self] {
        dto.results.map(Self.init(from:))
    }
    
    nonisolated init(from dto: PokemonResponseDTO.PokemonEntry) {
        let components = dto.url.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
                    .components(separatedBy: "/")
        let id = Int(components.last ?? "0") ?? 0

        self.init(
            id: id,
            name: dto.name
        )
    }
}
