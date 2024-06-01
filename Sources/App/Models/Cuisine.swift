//
//  File.swift
//  
//
//  Created by Nouf Sultan  on 15/08/1445 AH.
//

import Fluent
import Vapor

final class Cuisine: Model, Content{
    static let schema: String = "cuisine"
    
    /*
     .id()
     .field("cuisine_name", .string, requird)
     .field("cuisine_description", .string)
     .create()
     */
    @ID
    var id: UUID?
    
    
    @Field(key: "cuisine_name")
    var cuisineName: String
    
    @Field(key: "cuisine_description")
    var cuisineDescription: String
    
    @Children(for: \.$cusineId)
    var dishes: [Dish]
    
    init(){
        
    }
    
    init (id: UUID? = nil, name: String, description: String){
        self.id = id
        self.cuisineName = name
        self.cuisineDescription = description
    }
}
