class RandomFeedsController < ApplicationController
  rescue_from Errors::Base, with: :handle_error

  def show
    @microposts = []
    while @microposts.length < 10 do
      @microposts.concat(Micropost.get_rand_microposts(10))
    end
    @microposts = @microposts[0..9]
  end
  
  private

    def handle_error(error)
      render json: {message: error.detail}, status: error.status_code
    end

end
