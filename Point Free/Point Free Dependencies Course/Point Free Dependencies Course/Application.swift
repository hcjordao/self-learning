//
//  Point_Free_Dependencies_CourseApp.swift
//  Point Free Dependencies Course
//
//  Created by Henrique Capelatto Jordão on 17/02/26.
//

import SwiftUI

@main
struct Application: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: PokemonViewModel())
        }
    }
}
