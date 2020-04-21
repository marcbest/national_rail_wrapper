module NationalRailWrapper
  class Client

    def initialize(username:, password:)
      @credentials = {username: username, password: password}
    end

  end
end 