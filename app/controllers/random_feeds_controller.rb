class RandomFeedsController < ApplicationController
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
      randIndex = Random.rand(0..count)
      Micropost.where("id between #{randIndex} and #{randIndex + getFeedLength}")
    end

end
