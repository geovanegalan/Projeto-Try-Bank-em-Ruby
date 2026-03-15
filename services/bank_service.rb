## CREATE USER

def create_user (conn, username, password)
  conn.exec_params(
    "INSERT INTO accounts (username, password) VALUES ($1, $2)",
    [username, password]
  )

  puts "User created successfully."
end

#DEPOSIT

def deposit(conn, id, value)
  conn.exec_params(
    "UPDATE accounts SET balance = balance + $1 WHERE id = $2",
    [value, id]
  )
  puts "Deposit successful!"
end

#WITHDRAW

def withdraw(conn, id, value)
  conn.exec_params(
    "UPDATE accounts SET balance = balance - $1 WHERE id = $2",
    [value, id]
  )

  puts "Withdraw successful!"
end

## VALIDATE LOGIN

def login(conn, id, password)
  result = conn.exec_params(
    "SELECT * FROM accounts WHERE id = $1 AND password = $2",
    [id, password]
  )

  if result.ntuples > 0
    puts "Login successful!"
    return result[0]
  else
    puts "ID or password wrong!"
    return nil
  end
end

##TRANSFER

