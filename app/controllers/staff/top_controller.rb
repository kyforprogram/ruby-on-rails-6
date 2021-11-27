# class Staff::TopController < ApplicationController
class Staff::TopController < Staff::Base

  def index
    # raise Forbidden
    # raise RecordNotFound
    render action: "index"
  end

end