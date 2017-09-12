# require('sinatra')
# require('sinatra/reloader')
# require('pry')
#
# # get('/rectangle') do
# #   "This application will determine whether a rectangle is a square or not."
# # end
#
# # get('/rectangle') do
# #   @description = "This application will determine whether a rectangle is a square or not."
# #   erb(:input)
# # end
#
# # get('/') do
# #     @description = "This application will determine whether a rectangle is a square or not."
# #     erb(:input)
# # end
#
# get('/') do
#   erb(:input)
# end
#
# # get('/output') do
# #   binding.pry
# #   erb(:output)
# # end
#
# # get('/output') do
# #   length = params.fetch("length")
# #   width = params.fetch("width")
# #   if length == width
# #     @rectangle = "This is a square."
# #   else
# #     @rectangle = "This is not a square."
# #   end
# #   erb(:output)
# # end
#
# get('/output') do
#   @length = params.fetch("length")
#   @width = params.fetch("width")
#   if @length == @width
#     @rectangle = "This is a square."
#   else
#     @rectangle = "This is not a square."
#   end
#   erb(:output)
# end

require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/rectangle')

get('/') do
  erb(:input)
end

get('/output') do
  @length = params.fetch("length")
  @width = params.fetch("width")
  rectangle = Rectangle.new(@length, @width)
  if rectangle.square?
    @string_to_display = "This is a square."
  else
    @string_to_display = "This is not a square."
  end
  erb(:output)
end
