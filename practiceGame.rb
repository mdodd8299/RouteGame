require 'bundler'
Bundler.require

youWonT = false
youLoseT = false
tieT = false
$playerLoads = 0
$computerLoads = 0
notAllowed = true
fullArray = ["shoot", "load", "shield"]
partialArray = ["load", "shield"]

get '/game/:object' do
  player = params[:object]
  if $computerLoads < 1
    computer = partialArray.sample
  else
    computer = fullArray.sample
  end

  if player == "shoot"
    $playerLoads -= 1
  elsif player == "load"
    $playerLoads += 1
  end

  if computer == "shoot"
    $computerLoads -= 1
  elsif computer == "load"
    $computerLoads = $computerLoads + 1
  end

  if player == "shoot" && $playerLoads < 1
    tieT = true
    tie = "You can not shoot because you dont have any ammunition! Try again.  If you want to play again, please re-load the game."
  else
    if player == "shoot" && computer == "load"
      $playerLoads = 0
      $computerLoads = 0
      youWonT = true
      youWon = "You shot the computer. Great job! If you want to play again, please re-load the game."
    elsif computer == "shoot" && player == "load"
      $playerLoads = 0
      $computerLoads = 0
      youLoseT = true
      youLose = "The computer shot you. You lost. If you want to play again, please re-load the game."
    else
      if player == "load"
        playerStatus = "Loaded"
      elsif player == "shoot"
        playerStatus = "Shot"
      elsif player == "shield"
        playerStatus = "Shield"
      end

      if computer == "load"
        computerStatus = "Loaded"
      elsif computer == "shoot"
        computerStatus = "Shot"
      elsif computer == "shield"
        computerStatus = "Shield"
      end
    end
  end

  if youWonT == false && youLoseT == false && tieT == false
    "You: #{playerStatus.to_s} --> Your loads: #{$playerLoads.to_s} - - - - - - Computer: #{computerStatus.to_s} --> Computer Loads: #{$computerLoads.to_s}"
  elsif youWonT
    youWon.to_s
  elsif youLoseT
    youLose.to_s
  elsif tieT
    tie.to_s
  end
end