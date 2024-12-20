require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader' if development?

# ここにSinatraアプリケーションのコードを記述
get '/' do
  'fine!'
end