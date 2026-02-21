import Foundation
import Networking
import Shared

@Observable
public final class PokemonViewModel {
    private(set) var pokemons: [PokemonEntry] = []
    private(set) var isConnected: Bool

    private var pokemonClient: PokemonClient
    
    public init(
        isConnected: Bool = true,
        pokemonClient: PokemonClient
    ) {
        self.isConnected = isConnected
        self.pokemonClient = pokemonClient
    }
    
    @MainActor
    func fetchPokemons() async {
        do {
            self.pokemons = try await pokemonClient.pokemons()
        } catch {
            print(error)
        }
    }
}
