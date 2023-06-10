//
//  Pokemon.swift
//  PokedexSwiftUI
//
//  Created by Candra Prasetya on 11/06/23.
//

import Foundation

struct Pokemon: Decodable, Identifiable{
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
}

let MOCK_POKEMON: [Pokemon]=[
    .init(id: 0, name: "Bulbasaur", imageUrl: "bulbasaur", type: "poison"),
    .init(id: 0, name: "Charmander", imageUrl: "bulbasaur", type: "fire"),
    .init(id: 0, name: "Pikachu", imageUrl: "bulbasaur", type: "electric"),
    .init(id: 0, name: "Bulbasaur", imageUrl: "bulbasaur", type: "poison"),]
