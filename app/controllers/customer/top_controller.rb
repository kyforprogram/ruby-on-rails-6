class Customer::TopController < ApplicationController

  def index
    # raise StandardError
    # raise IpAddressRejected
    render action: "index"
  end

end