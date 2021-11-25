class Admin::TopController < ApplicationController

  def index
    # raise IpAddressRejected
    # raise ActiveRecord::RecordNotFound
    render action: "index"
  end

end
