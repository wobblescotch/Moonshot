//
//  ContentView.swift
//  Moonshot
//
//  Created by Aakash Kumar on 20/03/22.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showingGrid = true
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            Group {
                    if showingGrid {
                        GridView(astronauts: astronauts, missions: missions)
                    } else {
                        Lists(astronauts: astronauts, missions: missions)
                    }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    if showingGrid {
                        Label("Show as table", systemImage: "list.dash")
                    } else {
                        Label("Show as grid", systemImage: "square.grid.2x2")
                    }                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
