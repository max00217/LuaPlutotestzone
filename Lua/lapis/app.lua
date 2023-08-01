local lapis = require("lapis")
local db = require("lapis.db")
local Model = require("lapis.db.model").Model
local config = require("lapis.config").get()
local app = lapis.Application()
local MyTable = Model:extend("my_table")

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

app:match("/dbtest", function()
  local res = db.query("select * from my_table where id = ?", 10)
  return "ok!"
end)

app:match("/dbmodel", function()
  local row = MyTable:find(10)
  return "ok!"
end)

return app