class Customer::TopController < ApplicationController

  def index
    raise StandardError
    render action: "index"
  end

end