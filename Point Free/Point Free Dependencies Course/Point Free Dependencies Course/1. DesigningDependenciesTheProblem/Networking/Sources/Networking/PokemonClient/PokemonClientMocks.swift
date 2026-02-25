import Foundation
import Shared

@MainActor
public extension PokemonClient {
    static let happyPath = PokemonClient(
        pokemons: {
            PokemonEntry.mockPokemonList()
        },
        regions: {
            fatalError("Not implemented")
        }
    )
    
    static let empty = PokemonClient(
        pokemons: {
            []
        },
        regions: {
            []
        }
    )
    
    static let error = PokemonClient(
        pokemons: {
            throw NSError(domain: "", code: 1)
        },
        regions: {
            throw NSError(domain: "", code: 1)
        }
    )
}
