//
//  PokemonViewModel.swift
//  PokedexSwiftUI
//
//  Created by Candra Prasetya on 11/06/23.
//

import SwiftUI

class PokemonViewModel: ObservableObject{
    @Published var pokemon = [Pokemon]()
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init(){
        fetchPokemon()
    }
    
    func fetchPokemon(){
        guard let url = URL(string: baseUrl) else {return}
        URLSession.shared.dataTask(with: url){
            (data, response, error) in guard let data = data?.parseData(removeString: "null,") else {return}
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else {return}
            DispatchQueue.main.async{
                self.pokemon = pokemon
            }
        }.resume()
    }
    
    func backgroundColor(forType type: String)-> UIColor{
        switch type{
        case "fire": return .systemRed
        case "poison": return .systemIndigo
        case "water": return .systemBlue
        case "electric": return .systemYellow
        case "psychic": return .systemBrown
        case "ground": return .systemGray
        case "normal": return .systemOrange
        case "flying": return .systemCyan
        case "fairy": return .systemPink
        default: return .systemMint
        }
    }
}


extension Data{
    func parseData(removeString string: String)-> Data?{
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else {return nil}
        return data
    }
}
