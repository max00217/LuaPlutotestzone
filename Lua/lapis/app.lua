local lapis = require("lapis")
local config = require("lapis.config").get()

local app = lapis.Application()
app:enable("etlua")
app.layout = require "views.layout"

app:get("/", function(self)
  return { render = "index" }
end)

app:get("/list", function(self)
  self.my_favorite_things = {
    "Lua",
    "Kotlin",
    "Python",
    "JavaScript"
  }
  return { render = "list" }
end)


return app