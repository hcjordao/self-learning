import Foundation
import Network
import Networking
import Shared

@Observable
@MainActor
public final class PokemonViewModel {
    private(set) var pokemons: [PokemonEntry] = []
    private(set) var isConnected = true

    private let networkMonitor: NetworkMonitorClient
    private let pokemonClient: PokemonClient
    
    public init(
        networkMonitor: NetworkMonitorClient,
        pokemonClient: PokemonClient
    ) {
        self.networkMonitor = networkMonitor
        self.pokemonClient = pokemonClient
    }
    
    func fetchPokemons() async {
        pokemons = []
        
        do {
            pokemons = try await pokemonClient.pokemons()
        } catch {
            print(error)
        }
    }
    
    func startMonitoring() async {
        for await path in networkMonitor.networkPathUpdates() {
            isConnected = path.status == .satisfied
            
            if isConnected {
                await fetchPokemons()
            } else {
                pokemons = []
            }
        }
    }
}
