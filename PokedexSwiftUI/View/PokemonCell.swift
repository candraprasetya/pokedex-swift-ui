//
//  PokemonCell.swift
//  PokedexSwiftUI
//
//  Created by Candra Prasetya on 11/06/23.
//

import SwiftUI
import Kingfisher

struct PokemonCell: View {
    let pokemon: Pokemon
    let viewModel: PokemonViewModel
    let backgroundColor: Color
    
    init(pokemon: Pokemon, viewModel: PokemonViewModel){
        self.pokemon = pokemon
        self.viewModel = viewModel
        self.backgroundColor = Color(viewModel.backgroundColor(forType: pokemon.type))
    }
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Text(pokemon.name.capitalized).font(.headline).foregroundStyle(.white).padding(.top, 4).padding(.leading)
                
                HStack{
                    Text(pokemon.type)
                        .font(.subheadline).bold().foregroundStyle(.white).padding(.horizontal, 16).padding(.vertical, 8).overlay(
                        RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.25))
                    )
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 24)
                    KFImage(URL(string: pokemon.imageUrl)).resizable().scaledToFit()
                        .frame(width: 68, height: 68).padding([.bottom, .trailing], 4)
                }

            }
        }

        .background(backgroundColor)
        .cornerRadius(10)
    }
}
