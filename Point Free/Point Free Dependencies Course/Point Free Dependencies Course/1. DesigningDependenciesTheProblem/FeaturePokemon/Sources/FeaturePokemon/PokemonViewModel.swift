import Combine
import Foundation
import Networking
import Shared

@Observable
public final class PokemonViewModel {
    private(set) var pokemons: [PokemonEntry] = []
    private(set) var isConnected: Bool

    private var pokemonClient: PokemonClient
    private var pokemonRequestCancellable: AnyCancellable?
    
    public init(
        isConnected: Bool = true,
        pokemonClient: PokemonClient
    ) {
        self.isConnected = isConnected
        self.pokemonClient = pokemonClient
        
        self.pokemonRequestCancellable = pokemonClient
            .pokemons()
            .sink(
                receiveCompletion: { value in
                    print(value)
                },
                receiveValue: { [weak self] pokemons in
                    self?.pokemons = pokemons
                }
            )
    }
}
