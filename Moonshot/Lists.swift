//
//  Lists.swift
//  Moonshot
//
//  Created by Aakash Kumar on 26/03/22.
//

import SwiftUI

struct Lists: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {

            List {
                ForEach(missions) { mission in
                    NavigationLink {
                        Mission_View(mission: mission, astronauts: astronauts)
                    } label: {
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                                .background(.lightBackground)
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
//                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                            )
                    }
                }
                .listRowBackground(Color.darkBackground)
            }
            .listStyle(.plain)
            .navigationBarTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        
    }
}

struct Lists_Previews: PreviewProvider {
    static var previews: some View {
        Lists(astronauts: Bundle.main.decode("astronauts.json"), missions: Bundle.main.decode("missions.json"))
            .preferredColorScheme(.dark)
    }
}
