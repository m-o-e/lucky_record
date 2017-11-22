require "./app"

server = HTTP::Server.new("127.0.0.1", 8080, [
  Lucky::HttpMethodOverrideHandler.new,
  Lucky::LogHandler.new,
  Lucky::SessionHandler.new,
  Lucky::Flash::Handler.new,
  Lucky::ErrorHandler.new(action: Errors::Show),
  Lucky::RouteHandler.new,
  Lucky::StaticFileHandler.new("./public", false),
])

puts "Listening on http://127.0.0.1:8080..."

server.listen