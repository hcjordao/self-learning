//
//  Pokemon.swift
//  Point Free Dependencies Course
//

import Foundation

struct PokemonEntry: Identifiable {
    let id: Int
    let name: String

    var displayName: String {
        name.capitalized
    }
}

extension PokemonEntry {
    static func mockPokemonList() -> [Self] {
        [.mock(), .mock(), .mock(), .mock()]
    }
    
    static func mock(
        id: Int = 1,
        name: String = "bulbassaur"
    ) -> Self {
        .init(id: id, name: name)
    }
}
