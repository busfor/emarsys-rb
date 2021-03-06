module Emarsys
  # Custom error class for rescuing from Emarsys errors
  class Error < StandardError
    def initialize(code, text, status)
      @code = code
      @text = text
      @status = status
      super(build_error_message)
    end

    attr_reader :code, :text, :status

    def build_error_message
      "HTTP-Code: #{@status}, Emarsys-Code: #{@code} - #{@text}"
    end
  end

  # Raised when Emarsys returns a 400 HTTP status code
  class BadRequest < Error; end

  # Raised when Emarsys returns a 401 HTTP status code
  class Unauthorized < Error; end

  # Raised when Emarsys returns a 500 HTTP status code
  class InternalServerError < Error; end
end
