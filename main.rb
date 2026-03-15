require_relative "db/connection.rb"
require_relative "services/bank_service.rb"
conn = connect_db

puts "Welcome to Try Bank"


puts "Insert your ID and Password:"
puts "ID:"
get_user_id = gets.chomp.to_i
puts "Password:"
get_user_password = gets.chomp.to_s


user = login(conn, get_user_id, get_user_password)

if user 
  current_user = login(conn, get_user_id, get_user_password)
  puts "Welcome #{user["username"]}"
  puts "What do you have in mind today?"
  puts
  "1 - Deposit
  2 - Withdraw
  3 - Transfer"
   op = gets.chomp.to_i


  case op
  when 1
    puts "QUal o valor que deseja depositar?"
    n = gets.chomp.to_i
    deposit(conn, current_user["id"], n)
  when 2
    puts "Qual o valor que deseja sacar? Seu saldo atual é de #{current_user["balance"]}"
    n = gets.chomp.to_i
    withdraw(conn, current_user["id"], n)
  when 3
    puts "Digite o valor que deseja transferir:"
    value = gets.chomp.to_i
    puts "Digite o ID pra quem deseja transferir:"
    user_id = gets.chomp.to_i

    result = conn.exec_params(
      "SELECT username FROM accounts WHERE id = $1",
      [target_id]
    )

    target_name = result[0]["username"]


    puts "Do you wanna transfer #{value} to #{target_name}?"
  end
else 
  puts "Error on login!"
end





