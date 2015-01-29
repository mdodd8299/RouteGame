require 'bundler'
Bundler.require

get '/' do
  redirect url('/throw/anything')
end

get '/throw/:object' do
  player = params[:object]
  computer = ["rock", "paper", "scissors"].sample

  if player == computer
    "You have guessed the same thing"
  elsif player == "rock" && computer == "scissors"
    "You beat the the computer. He chose #{computer}, and you chose #{player}. #{player} beats #{computer}"
  elsif player == "scissors" && computer == "rock"
    "The computer beat you. He chose #{computer}, and you chose #{player}. #{computer} beats #{player}"
  elsif player == "paper" && computer == "rock"
    "You beat the the computer. He chose #{computer}, and you chose #{player}. #{player} beats #{computer}"
  elsif player == "rock" && computer == "paper"
    "The computer beat you. He chose #{computer}, and you chose #{player}. #{computer} beats #{player}"
  elsif player == "scissors" && computer == "paper"
    "You beat the the computer. He chose #{computer}, and you chose #{player}. #{player} beats #{computer}"
  elsif player == "paper" && computer == "scissors"
    "The computer beat you. He chose #{computer}, and you chose #{player}. #{computer} beats #{player}"
  end

end
