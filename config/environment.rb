# Load the rails application
require File.expand_path('../application', __FILE__)
#access_token=l8Wiz0y0kIkum7Ms31oc id=3396393
#Сделать рубильник - голоса считаются при шаринге или при открытии окна соц сети - как на 1001 голос
# Initialize the rails application
Battle::Application.initialize!

ENV['CLASS']  = "Lot"
