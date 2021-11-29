# class Admin::TopController < ApplicationController
class Admin::TopController < Admin::Base

  def index
    # raise IpAddressRejected
    # raise ActiveRecord::RecordNotFound
    render action: "index"
  end

end
