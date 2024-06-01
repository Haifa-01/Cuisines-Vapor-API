
//  File.swift
//
//
//  Created by Nouf Sultan  on 09/08/1445 AH.


import Foundation
import Vapor

struct UserController: RouteCollection{
    func boot(routes: RoutesBuilder) throws {
            let users = routes.grouped("User")
        users.post(use: createuser)
        users.get(use: getAllUsers)
        users.put(use: updateUser)
        users.delete(use: deleteUser)
        }
}
func getAllUsers(req:Request) async throws -> [Cuisine]{
    
    return try await Cuisine.query(on: req.db).all()
}
    //Create
//    func create(req:Request) async throws -> Cuisine{
//        let newCuisine = try req.content.decode(Cuisine.self)
//        try await newCuisine.create(on: req.db)
//        return newCuisine
//    }
func createuser(req:Request) async throws -> Cuisine{
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
    func updateUser(req:Request) async throws -> Cuisine{
        let newCuisine = try req.content.decode(Cuisine.self)
        guard let cuisineInDB = try await Cuisine.find(newCuisine.id, on: req.db) else {
            throw Abort(.notFound)
        }
        cuisineInDB.cuisineName = newCuisine.cuisineName
        try await cuisineInDB.save(on: req.db)
        return newCuisine
    }

    //Delete by ID
    func deleteUser(req:Request) async throws -> String{
        let recipeID = req.body.string ?? "nil"
        return ""
    }


