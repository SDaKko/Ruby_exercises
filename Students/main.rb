require 'fox16'
require_relative 'student_app.rb'
include Fox

app = FXApp.new("Students", "Students")
StudentApp.new(app)
app.create
app.run