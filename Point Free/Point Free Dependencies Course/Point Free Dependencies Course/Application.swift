import FeaturePokemon
import NetworkingLive
import SwiftUI

@main
struct Application: App {
    var body: some Scene {
        WindowGroup {
            PokemonView(
                viewModel: PokemonViewModel(
                    pokemonClient: .live
                )
            )
        }
    }
}
