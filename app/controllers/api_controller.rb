class ApiController < ApplicationController

  require 'rubygems'
  require 'json'
  require 'net/http'

  def index
    @all_data = fetch "http://dev.dryan.net.s3.amazonaws.com/students.json"
    array_of_years = ["senior", "junior", "sophomore", "freshman"]

    @sorted_data = @all_data.sort_by do |hash|
      array_of_years.index(hash["grade"].downcase)
    end
  end

  def fetch(url)
     resp = Net::HTTP.get_response(URI.parse(url))
     data = resp.body
     JSON.parse(data)
  end
end
