import Vapor
import Fluent
import FluentPostgresDriver
// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))


    //connection with the database
    app.databases.use(.postgres(configuration:
                                         SQLPostgresConfiguration(hostname: "localhost",
                                         username: "postgres", password: "",
                                         database: "recipesdb",
                                         tls:.prefer(try .init(configuration: .clientDefault)))),
                                         as: .psql)

    
    // register routes
    try routes(app)
    
    
    //Migrations
    app.migrations.add(CreateUserTableMigration())
   
    app.migrations.add(CreateCuisineTableMigration())
   
    app.migrations.add(CreateDishTableMigration())
    try await app.autoMigrate()
    
  //CreateDishTableMigration
    // CreateCuisineTableMigration
}
