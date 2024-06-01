import Vapor



func routes(_ app: Application) throws {
     try app.register(collection: CuisinesController())
    
//    app.group("dishs") { dishs in
//        dishs.get("all"){ req async -> String in
//            return "All dishs displayed"
//        }
//        dishs.post("create"){ req async -> String in
//            return "New dishs create"
//        }
//
//    }
    
    
    
//    func routes(_ app: Application) throws {
//        // GET
//        app.get("dishs"){ req async -> String in
//            return "All dishs displayed"
//        }
//
//        // POST
//        app.post("dishs") { req async -> String in
//            return "New dishs create"
//        }
//
//        // PUT
//        app.put("dishs") { req async -> String in
//            let dishID = req.parameters.get("id")!
//            return "Update dish with ID: \(dishID)"
//        }
//
//        // DELETE
//        app.delete("dishs") { req async -> String in
//            let dishID = req.parameters.get("id")!
//            return "Delete dish with ID: \(dishID)"
//        }
//
//
//    }
    
    /*
     all data type (strin, flout,double ... ect) is conform to the protocol has name Content , except (Any)
     so, what i should do ? there is solution , using JSONSerialization
     by using this class --> JSONSerialization ,, we can convert everything to JSON
     But its old way !!
     there is a better solution , which is using the (( Content Protocol ))
    */
    
//    app.get("users"){ req async throws -> [[String:Any]] in
//        let users = [["name":"Sara", "major":"IT", "age":22], ["name":"Amal", "major":"SE", "age":25]]
//        return users
//    }
        app.get("users"){ req async throws -> [User] in // this is receive json from server to clinet
            let users:[User] = [.init(name: "Sara", age: 22, magor:"IT"),
                                .init(name: "Amal", age: 23, magor:"SE")
            ]
            return users
        }
//    ٨ هذي فانكشن رجعنا من خلاله اليوزرز على شكل جيسون
//    ٧ و هذي فانكشن استقبلنا جيسون و حولنا إلى يوزر ، عشان بعدين نخزنه في الداتا بيس او غير غيره
//
    
 
    
    
    //اتخيل كأني باخذ معلومات من المستخدم و ادخلها في الداتابيس حقتي
   // app.post("users"){ req async throws -> [User] in // this is receive json from clinet to server
        // في الريكويست فيها كل شي يخص البودي، اللي نسوي انو نكتب ريك و دوت و بعدها نختار اللي نبيه
/* الكونتنت تعبر عن البودي */
//        req.content.decode(User.self)
//        return users
//         بنخليه بدون الاقواس و بنسوي ليت [User] اعطاني ايرور في لايت الريتيرن ، فاا عشانه مثل بنرسل اليوزر مو كآري فوق
    app.post("users"){ req async throws -> User in
        let user = try req.content.decode(User.self)
        print(user.name,"🐬")
        return user
        /*
         المقصد باللاين اللي فوق :
         في الفايبر اللي هنا ، معبرين عن البودي بالكونتنت بمعنى:شفت الريكويست اللي جاي من الكلايت؟ روح لجزئية الكونتنت اللي هي البودي
         دوت ، ترا بيمديك تعمل لها دي كودينق إلى داتا تايب معين ، اللي هو في حالتنا (اليوزر)          */
        
        /*
         المقصد من اللاين ذا : انو شفت الكويست اللي جاي من الكلايت ؟ روح لجزئية البودي ، و خذها و حولها ليوزر
         */
      
    }
    
//   Often, when I have a data set that represents one thing, it is not placed in a dictionary,
//   but rather we create a struct that represents it.
    
    struct User: Content{ // its is content protocol
        let name: String
        let age: Int
        let magor: String
    }
}
