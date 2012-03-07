class GameController < ApplicationController

	before_filter do
		if !session[:start]
		session[:start] = 'yes'
  		
		# initialize game session variables
  		session[:wins] = 0
		session[:losses] = 0
		session[:tie] = 0
	end
		@defeat = {rock: :scissors, paper: :rock, scissors: :paper}
  		@throws = @defeat.keys
		@message = {:tie => "You tied the computer. Try again.", :win => "Nicely done,", :loss => "Ouch..." }
	end

  def recordResult(playerThrow, compThrow)
    if playerThrow == compThrow
      session[:tie] += 1
	  @result = @message[:tie]
    elsif compThrow == @defeat[playerThrow] 
      session[:wins] += 1
      @result = "#{@message[:win]} #{playerThrow} beats #{compThrow}. Congratulations!"
    else
      session[:losses] += 1
      @result = "#{@message[:loss]} #{compThrow} beats #{playerThrow}. Better luck next time!"
	end
	return @result
  end
  
  def home
    @title = "home"
	if !session[:start]
		session[:start] = 'yes'
  		
		# initialize game session variables
  		session[:wins] = 0
		session[:losses] = 0
		session[:tie] = 0
	end
  end

  def rock
  	@title = "rock"
	@opposition = @throws.sample #computer throw
	@output = recordResult(:rock, @opposition)	
  end

  def paper
  	@title = "paper"
	@opposition = @throws.sample #computer throw
	@output = recordResult(:paper, @opposition)	
  end

  def scissors
  	@title = "scissors"
	@opposition = @throws.sample #computer throw
	@output = recordResult(:scissors, @opposition)	
  end

  def stats
  	@title = "stats"
	@wins = session[:wins]
	@losses = session[:losses]
	@ties = session[:tie]
	@total = @wins + @losses + @ties
  end
  
  def reset
    reset_session
	redirect_to root_path
  end

end
