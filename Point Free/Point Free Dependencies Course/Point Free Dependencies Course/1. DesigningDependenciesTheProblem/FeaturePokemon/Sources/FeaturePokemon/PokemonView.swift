import Networking
import Shared
import SwiftUI

public struct PokemonView: View {
    @State private var viewModel: PokemonViewModel

    public init(viewModel: PokemonViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationStack {
            loadedView
                .navigationTitle("Kanto Pokédex")
                .task {
                    await viewModel.fetchPokemons()
                }
        }
        .overlay(alignment: .bottom) {
            if !viewModel.isConnected {
                Text("No internet connection")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(.red)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .animation(.easeInOut, value: viewModel.isConnected)
    }
    
    var loadedView: some View {
        List(viewModel.pokemons) { entry in
            HStack {
                Text("#\(entry.id)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .frame(width: 44, alignment: .leading)

                Text(entry.displayName)
                    .font(.body)
            }
        }
    }
}

#Preview {
    PokemonView(
        viewModel: PokemonViewModel(
            isConnected: true,
            pokemonClient: .happyPath
        )
    )
}
