//
//  Pizza Model.swift
//  pizza frenzy
//
//  Created by ASMI iOS Dev on 13/07/22.
//

import SwiftUI
import Foundation

struct Pizza: Identifiable {
    let id = UUID().uuidString
    let pizzaImage:String
    let pizzaTitle:String
    let description: String
    let price: String
}
var pizzas: [Pizza] = [
 Pizza(pizzaImage: "PizzaA", pizzaTitle:"Farmhouse Pizza" , description: "Crunchy and crisp capsicum, juicy tomatoes, and succulent mushrooms", price: "$450"),
  Pizza(pizzaImage: "PizzaB", pizzaTitle:"Veg Extravaganza Pizza" , description: "pepperoni, ham, Italian sausage, fresh onions, fresh green peppers, fresh mushrooms, and black olives ", price: "$550"),
 Pizza(pizzaImage: "PizzaC", pizzaTitle:"Margherita Pizza" , description: "Neapolitan pizza, typically made with tomatoes, mozzarella cheese, garlic, fresh basil, and extra-virgin olive oil", price: "$600")
]

struct Crust:Identifiable{
    let id : Int
    let name :String
}

var crust:[Crust] = [Crust(id:1,name: "Thin Crust"),
                     Crust(id:2,name: "Cheese Burst"),
                     Crust(id:3,name: "Flat Bread"),
]




