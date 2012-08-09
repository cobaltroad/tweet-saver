class TweetsController < ApplicationController

  def index
    q = params[:q]

    @response = {}
    unless q.blank?
      @response = Tweet.search(q)
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

end