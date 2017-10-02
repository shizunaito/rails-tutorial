module Errors
  class InvalidFeedLengthError < Base

    def detail
       "Invalid feed length"
    end

    def status_code
      500
    end

  end
end
