//
//  File.swift
//  
//
//  Created by Nouf Sultan  on 09/08/1445 AH.
//

import Foundation
import Vapor

struct CuisinesController: RouteCollection{
    func boot(routes: RoutesBuilder) throws {
        let cuisines = routes.grouped("Cuisines")
        cuisines.post(use: createCuisine)
        cuisines.get(use: getAllCuisines)
        cuisines.put(use: updateCuisines)
        cuisines.delete(use: deleteCuisines)
        }
}
func getAllCuisines(req:Request) async throws -> [Cuisine]{
    
    return try await Cuisine.query(on: req.db).all()
}
    //Create
//    func create(req:Request) async throws -> Cuisine{
//        let newCuisine = try req.content.decode(Cuisine.self)
//        try await newCuisine.create(on: req.db)
//        return newCuisine
//    }
func createCuisine(req:Request) async throws -> Cuisine{
    let newCuisine = try req.content.decode(Cuisine.self)
    try await newCuisine.create(on: req.db)
    return newCuisine
}

    //Read
//    func read(req:Request) async throws -> String{
//        
//        return ""
//    }

    //Update by ID
    func updateCuisines(req:Request) async throws -> Cuisine{
        let newCuisine = try req.content.decode(Cuisine.self)
        guard let cuisineInDB = try await Cuisine.find(newCuisine.id, on: req.db) else {
            throw Abort(.notFound)
        }
        cuisineInDB.cuisineName = newCuisine.cuisineName
        cuisineInDB.cuisineDescription = newCuisine.cuisineDescription
        try await cuisineInDB.save(on: req.db)
        return newCuisine
    }
// cuisine_description
    //Delete by ID
    func deleteCuisines(req:Request) async throws -> Cuisine{
        let cuisineID = req.parameters.get ("id", as: UUID.self)
        guard let cuisineInDB = try await Cuisine.find(cuisineID, on: req.db) else {
            throw Abort(.notFound)
        }
        try await cuisineInDB.delete(on: req.db)
        return cuisineInDB
    }


//func deleteCuisines(req: Request) throws -> EventLoopFuture<HTTPStatus> {
//   // let cuisineID = try req.parameters.require("id", as: UUID.self)
//    return Cuisine.find(req.parameters.get("cuisineID"), on: req.db)
//        .unwrap(or: Abort(.notFound))
//        .flatMap { $0 . delete(on: req.db) }
//        . transform(to: .ok)
//        }
//       


