class Staff::TopController < ApplicationController

  def index
    # raise Forbidden
    # raise RecordNotFound
    render action: "index"
  end

end