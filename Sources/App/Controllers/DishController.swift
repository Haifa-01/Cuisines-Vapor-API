
import Foundation
import Vapor

struct DishController: RouteCollection{
    func boot(routes: RoutesBuilder) throws {
        let dish = routes.grouped("Dish")
        dish.post(use: createDish)
        dish.get(use: getAllDishs)
//            recipes.get(use: read)
        dish.put(use: updateDishs)
        dish.delete(use: deleteDish)
        }
}
func getAllDishs(req:Request) async throws -> [Dish]{
    
    return try await Dish.query(on: req.db).all()
}
    //Create
//    func create(req:Request) async throws -> Cuisine{
//        let newCuisine = try req.content.decode(Cuisine.self)
//        try await newCuisine.create(on: req.db)
//        return newCuisine
//    }
func createDish(req:Request) async throws -> Dish{
    let newDish = try req.content.decode(Dish.self)
    try await newDish.create(on: req.db)
    return newDish
}

    //Read
//    func read(req:Request) async throws -> String{
//
//        return ""
//    }

    //Update by ID
    func updateDishs(req:Request) async throws -> Dish{
        let newDish = try req.content.decode(Dish.self)
        guard let dishInDB = try await Dish.find(newDish.id, on: req.db) else {
            throw Abort(.notFound)
        }
        dishInDB.dishName = newDish.dishName
        try await dishInDB.save(on: req.db)
        return newDish
    }

    //Delete by ID
    func deleteDish(req:Request) async throws -> String{
//        let dishID = req.body.string ?? "nil"
        return ""
    }


