import Foundation
import Shared

@MainActor
public extension PokemonClient {
    static let happyPath = PokemonClient(
        pokedex: { _ in
            Pokedex.mock()
        },
        regions: {
            fatalError("Not implemented")
        }
    )
    
    static let empty = PokemonClient(
        pokedex: { _ in
            Pokedex.mock(pokemons: [])
        },
        regions: {
            []
        }
    )
    
    static let error = PokemonClient(
        pokedex: { _ in
            throw NSError(domain: "", code: 1)
        },
        regions: {
            throw NSError(domain: "", code: 1)
        }
    )
}
