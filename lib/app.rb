require 'sinatra/base'
require 'sinatra/partial'
require 'stripe'
require 'data_mapper'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/sculpt_#{env}")

require './lib/user'
require './lib/order'
require './lib/comment'

DataMapper.finalize
DataMapper.auto_upgrade!

class Sculpt < Sinatra::Base

enable :sessions
set :session_secret, 'super secret'
use Rack::MethodOverride

set :views, File.join(File.dirname(__FILE__), '..', 'views')
set :public_folder, File.join(File.dirname(__FILE__), '..', 'public')
set :partial_template_engine, :erb

set :publishable_key, ENV['PUBLISHABLE_KEY']
set :secret_key, ENV['SECRET_KEY']

Stripe.api_key = settings.secret_key

  get '/' do
    erb :homepage
  end

  get '/signup' do
    erb :signup
  end

  get '/sculpts' do
    erb :sculpts
  end

  get '/madmax' do
    erb :pmadmax
  end

  get '/donatello' do
    erb :pdonatello
  end

  get '/timelines' do
    erb :timelines
  end

  get '/about' do
    erb :about
  end

  post '/user/new' do
    name = params["name"]
    email = params["email"]
    password = params["password"]
    password_confirmation = params["password_confirmation"]
    created_at = Time.now
    user = User.create(:name => name, :email => email, 
              :password => password, 
              :password_confirmation => password_confirmation, 
              :created_at => created_at)
    session[:user_id] = user.id
    redirect to('/welcome')
  end

  post '/sessions' do
    email, password = params[:signInEmail], params[:signInPassword]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect to('/welcome')
    else
      erb :signup
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect to('/')
  end

  get '/welcome' do
    erb :welcomeuser  
  end
  
  get '/allusers' do
    @users = User.all
    erb :userindex
  end

  get '/allorders' do
    @orders = Order.all
    @charges = Stripe::Charge.all
    erb :order_index
  end

  get '/forum/madmax' do
    @comments = Comment.madmax
    erb :forum_max
  end

  get '/forum/donatello' do
    @comments = Comment.donatello
    erb :forum_doni
  end

   get '/forum/upcoming' do
    @comments = Comment.upcoming
    erb :forum_upcoming
  end

  post '/comment' do
    created_at = Time.now
    forum = params[:forum]
    Comment.create(:useremail => params[:useremail], :body => params[:comment], :forum => forum, :created_at => created_at) 
    redirect to("/forum/#{forum}")
  end

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id]) if session[:user_id]
    end 

     def current_page_home?
      path = request.path_info
      return true if path == '/' 
      return false if path != '/'
     end 
  end


  #start the server if ruby file executed directly
  run! if app_file == $0
end




