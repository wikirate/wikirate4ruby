module Wikirate4ruby
  class Error < StandardError

    # @return [Integer]
    attr_reader :code

    Wikirate4rubyError = Class.new(self)

    # Raised when a Parsing error is occured
    ParsingError = Class.new(self)

    #Raised when an Incompatible Card Type is given as a type when try to parse an API response
    IncompatibleCardTypeError = Class.new(ParsingError)

    # Raised when Wikirate returns a 4xx HTTP status code
    ClientError = Class.new(self)

    # Raised when Wikirate returns the HTTP status code 400
    BadRequest = Class.new(ClientError)

    # Raised when Wikirate returns the HTTP status code 401
    Unauthorized = Class.new(ClientError)

    # Raised when Wikirate returns the HTTP status code 403
    Forbidden = Class.new(ClientError)

    # Raised when Wikirate returns the HTTP status code 413
    RequestEntityTooLarge = Class.new(ClientError)

    # Raised when Wikirate returns the HTTP status code 404
    NotFound = Class.new(ClientError)

    # Raised when Wikirate returns the HTTP status code 406
    NotAcceptable = Class.new(ClientError)

    # Raised when Wikirate returns the HTTP status code 422
    UnprocessableEntity = Class.new(ClientError)

    # Raised when Wikirate returns the HTTP status code 429
    TooManyRequests = Class.new(ClientError)

    # Raised when Wikirate returns a 5xx HTTP status code
    ServerError = Class.new(self)

    # Raised when Wikirate returns the HTTP status code 500
    InternalServerError = Class.new(ServerError)

    # Raised when Wikirate returns the HTTP status code 502
    BadGateway = Class.new(ServerError)

    # Raised when Wikirate returns the HTTP status code 503
    ServiceUnavailable = Class.new(ServerError)

    # Raised when Wikirate returns the HTTP status code 504
    GatewayTimeout = Class.new(ServerError)

    # Raised when an operation subject to timeout takes too long
    TimeoutError = Class.new(self)

    HTTP_ERRORS = {
      400 => Wikirate4ruby::Error::BadRequest,
      401 => Wikirate4ruby::Error::Unauthorized,
      403 => Wikirate4ruby::Error::Forbidden,
      404 => Wikirate4ruby::Error::NotFound,
      406 => Wikirate4ruby::Error::NotAcceptable,
      413 => Wikirate4ruby::Error::RequestEntityTooLarge,
      422 => Wikirate4ruby::Error::UnprocessableEntity,
      429 => Wikirate4ruby::Error::TooManyRequests,
      500 => Wikirate4ruby::Error::InternalServerError,
      502 => Wikirate4ruby::Error::BadGateway,
      503 => Wikirate4ruby::Error::ServiceUnavailable,
      504 => Wikirate4ruby::Error::GatewayTimeout
    }.freeze

    PARSING_ERRORS = {
      'IncompatibleCardType' => Wikirate4ruby::Error::IncompatibleCardTypeError
    }.freeze

    class << self

      def from_processing_response(error)
        klass = PARSING_ERRORS[error[:name]] || self
        message = error[:message]
        klass.new(message)
      end
    end

    # Initializes a new Error object
    #
    # @param message [Exception, String]
    # @param code [Integer]
    # @return [Wikirate4ruby::Error]
    def initialize(message = '', code = nil)
      super(message)
      @code = code
    end
  end
end
