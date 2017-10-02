class RandomFeedsController < ApplicationController
  rescue_from Errors::Base, with: :handle_error

  def show
    @microposts = []
    while @microposts.length < 10 do
      @microposts.concat(get_rand_microposts(10))
    end
    @microposts = @microposts[0..9]
  end
  
  private

    def get_rand_microposts(getFeedLength)
      count = Micropost.count() - getFeedLength
      raise Errors::InvalidFeedLengthError if count < 0
      randIndex = Random.rand(0..count)
      Micropost.where("id between #{randIndex} and #{randIndex + getFeedLength}")
    end

    def handle_error(error)
      render json: {message: error.detail}, status: error.status_code
    end

end
