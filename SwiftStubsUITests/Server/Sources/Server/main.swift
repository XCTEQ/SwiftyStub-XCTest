import Vapor

let drop = try Droplet()

drop.get("hello") { req in
  return "Hello Vapor"
}

drop.get("users/shashikant86") { request in
    var json = JSON()
    try json.set("location", "Vapor")
    return json
}

try drop.run()

