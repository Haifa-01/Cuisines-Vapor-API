//
//  File.swift
//  
//
//  Created by Nouf Sultan  on 15/08/1445 AH.
//

import Fluent

struct CreateDishTableMigration: AsyncMigration{
    
    func prepare(on database: Database) async throws {
       try await database.schema("dish")
            .id()
            .field("dish_name", .string)
            .field("cuisine_id", .uuid, .references("cuisine", "id")) // primary key
            .field("ingredients", .string)
            .field("price", .double)
            .create()
    }
    
    
    func revert(on database: Database) async throws {
        try await database.schema("dish")
            .delete()
    }
}

