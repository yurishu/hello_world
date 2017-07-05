class PagesController < ApplicationController
  def home
    puts "Hello World!"
    Note.create(name: "yuri")
    @notes_count = Note.count
  end
end
