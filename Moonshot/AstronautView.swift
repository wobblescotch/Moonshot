//
//  Astronaut-View.swift
//  Moonshot
//
//  Created by Aakash Kumar on 25/03/22.
//

import SwiftUI

struct Astronaut_View: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
                
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Astronaut_View_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronaut.json")
    
    static var previews: some View {
        Astronaut_View(astronaut: astronauts["armstrong"]!)
    }
}
