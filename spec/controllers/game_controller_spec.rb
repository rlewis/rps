require 'spec_helper'

describe GameController do
render_views

  describe "GET 'home'" do
    it "should be successful" do
      get :home
      response.should be_success
    end

    it "should have the right title" do
      get :home
      response.should have_selector("title", :content => "Ruby RPS | home")
    end
  end

  describe "GET 'rock'" do
   	it "should be successful" do
      get :rock
	  #let's try to initialize some session variables for testing
	  response.should be_success
    end

    it "should have the right title" do
       get :rock
       response.should have_selector("title", :content => "Ruby RPS | rock")
    end
	
	it "should compare user throw with computer throw" do
	   get :rock #user throw
	   @user = :rock
	   @defeat = {rock: :scissors, paper: :rock, scissors: :paper}
  	   @throws = @defeat.keys
	   @message = {:tie => "You tied the computer. Try again.", :win => "Nicely done,", :loss => "Ouch..." }
	   @opposition = assigns(:opposition)
	   puts @user
	   puts @opposition
	   if @user == @opposition
	     response.should have_selector("h3", :content => "You tied the computer. Try again.")
	   elsif @opposition == @defeat[@user]
	     response.should have_selector("h3", :content => "Nicely done, #{@user} beats #{@opposition}. Congratulations!")
	   else
	     response.should have_selector("h3", :content => "Ouch... #{@opposition} beats #{@user}. Better luck next time!")
	   end
    end
  end

  describe "GET 'paper'" do
   	it "should be successful" do
      get :paper
	  #let's try to initialize some session variables for testing
	  response.should be_success
    end

    it "should have the right title" do
       get :paper
       response.should have_selector("title", :content => "Ruby RPS | paper")
    end
	
	it "should compare user throw with computer throw" do
	   get :paper #user throw
	   @user = :paper
	   @defeat = {rock: :scissors, paper: :rock, scissors: :paper}
  	   @throws = @defeat.keys
	   @message = {:tie => "You tied the computer. Try again.", :win => "Nicely done,", :loss => "Ouch..." }
	   @opposition = assigns(:opposition)
	   puts @user
	   puts @opposition
	   if @user == @opposition
	     response.should have_selector("h3", :content => "You tied the computer. Try again.")
	   elsif @opposition == @defeat[@user]
	     response.should have_selector("h3", :content => "Nicely done, #{@user} beats #{@opposition}. Congratulations!")
	   else
	     response.should have_selector("h3", :content => "Ouch... #{@opposition} beats #{@user}. Better luck next time!")
	   end
    end	
  end
  
    describe "GET 'scissors'" do
   	it "should be successful" do
      get :scissors
	  #let's try to initialize some session variables for testing
	  response.should be_success
    end

    it "should have the right title" do
       get :scissors
       response.should have_selector("title", :content => "Ruby RPS | scissors")
    end
	
	it "should compare user throw with computer throw" do
	   get :scissors #user throw
	   @user = :scissors
	   @defeat = {rock: :scissors, paper: :rock, scissors: :paper}
  	   @throws = @defeat.keys
	   @message = {:tie => "You tied the computer. Try again.", :win => "Nicely done,", :loss => "Ouch..." }
	   @opposition = assigns(:opposition)
	   puts @user
	   puts @opposition
	   if @user == @opposition
	     response.should have_selector("h3", :content => "You tied the computer. Try again.")
	   elsif @opposition == @defeat[@user]
	     response.should have_selector("h3", :content => "Nicely done, #{@user} beats #{@opposition}. Congratulations!")
	   else
	     response.should have_selector("h3", :content => "Ouch... #{@opposition} beats #{@user}. Better luck next time!")
	   end
    end
  end
  
  describe "GET 'stats'" do
   	it "should be successful" do
      get :stats
	  #let's try to initialize some session variables for testing
	  response.should be_success
    end

    it "should have the right title" do
       get :stats
       response.should have_selector("title", :content => "Ruby RPS | stats")
    end
	
	it "should update stats" do
	   get :stats 
	   @total = assigns(:total)
	   response.should have_selector("h3", :content => "Total Games Played: #{@total}")
    end
  end 
  
	
end


