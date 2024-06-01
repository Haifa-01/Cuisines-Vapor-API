//
//  File.swift
//  
//
//  Created by Nouf Sultan  on 15/08/1445 AH.
//

import Fluent
import Vapor

final class Dish: Model, Content{
    static let schema: String = "dish"
    
    /*
     .id()
     .field("user_name", .string)
// cuisine id FK
     .field("dish_description", .string)
     .field("ingredients", .string)
     .field("price", .double)
     .create()
     */
    @ID
    var id: UUID?
    
    @Parent (key: "id")
    var cusineId: Cuisine
    
    @Field(key: "dish_name")
    var dishName: String
    
    @Field(key: "ingredients")
    var ingredients: String
    
    @Field(key: "price")
    var price: Double
    
    
    
    
    init(){
        
    }
    
    init (id: UUID? = nil, cusineId: UUID, dishName: String, ingredients: String, price: Double){
        self.id = id
        self.$cusineId.id = cusineId
        self.dishName = dishName
        self.ingredients = ingredients
        self.price = price
    }
}

