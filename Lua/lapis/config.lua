local config = require("lapis.config")

config("development", {
  server = "nginx",
  code_cache = "off",
  num_workers = "1",
  port = 5000,
  greeting = "Lapis with LuaJIT",
  -- sqlite = {
  --   database = "my_database.sqlite",
  -- }
  mysql = {
    host = "127.0.0.1",
    user = "mysql_user",
    password = "the_password",
    database = "my_database"
  }
})
