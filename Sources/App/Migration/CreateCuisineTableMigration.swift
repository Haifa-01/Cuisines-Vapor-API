//
//  File.swift
//  
//
//  Created by Nouf Sultan  on 15/08/1445 AH.
//

import Fluent

struct CreateCuisineTableMigration: AsyncMigration{
    
    func prepare(on database: Database) async throws {
       try await database.schema("cuisine")
            .id()
            .field("cuisine_name", .string)
            .field("cuisine_description", .string)
            .create()
    }
    
    
    func revert(on database: Database) async throws {
        try await database.schema("cuisine")
            .delete()
    }
}
