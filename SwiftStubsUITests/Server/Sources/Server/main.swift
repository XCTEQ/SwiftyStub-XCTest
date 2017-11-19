import Vapor

let drop = try Droplet()

drop.get("hello") { req in
  return "Hello Vapor"
}

drop.get("users/shashikant86") { request in
    var json = JSON()
    try json.set("location", "SD")
    return json
}

try drop.run()

