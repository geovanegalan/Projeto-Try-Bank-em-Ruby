require "pg"

def connect_db
  PG.connect(
  dbname: "try_bank",
  user: "postgres",
  password: "postgres123"
)
end

