import Combine
import Foundation
import Shared

@MainActor
public extension PokemonClient {
    static let happyPath = PokemonClient(
        pokemons: {
            Just(PokemonEntry.mockPokemonList())
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        },
        regions: {
            fatalError("Not implemented")
        }
    )
    
    static let empty = PokemonClient(
        pokemons: {
            Just([])
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        },
        regions: {
            Just([])
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    )
    
    static let error = PokemonClient(
        pokemons: {
            Fail(error: NSError(domain: "", code: 1))
                    .eraseToAnyPublisher()
        },
        regions: {
            Fail(error: NSError(domain: "", code: 1))
                    .eraseToAnyPublisher()
        }
    )
}
