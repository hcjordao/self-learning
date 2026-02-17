//
//  ContentView.swift
//  Point Free Dependencies Course
//
//  Created by Henrique Capelatto Jordão on 17/02/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel: PokemonViewModel

    init(viewModel: PokemonViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            loadedView
                .navigationTitle("Kanto Pokédex")
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

import Combine

#Preview {
    ContentView(
        viewModel: PokemonViewModel(
            isConnected: true,
            pokemonClient: MockPokemonClient(
                _pokemons: {
                    Just(PokemonEntry.mockPokemonList())
                        .setFailureType(to: Error.self)
                        .eraseToAnyPublisher()
                },
                _regions: {
                    Just([])
                        .setFailureType(to: Error.self)
                        .eraseToAnyPublisher()
                }
            )
        )
    )
}
