//
//  File.swift
//  
//
//  Created by Nouf Sultan  on 15/08/1445 AH.
//

import Fluent
import Vapor

final class User: Model, Content{
    static let schema: String = "user"
    
    
    @ID
    var id: UUID?
    
    
    
    @Field(key: "user_name")
    var userName: String
    
    
    init(){
        
    }
    
    
    init (id: UUID? = nil, name: String){
        self.id = id
        self.userName = name
    }
}

