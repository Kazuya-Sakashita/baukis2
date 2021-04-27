class Admin::Authenticator
    def initialize(administrator)
        @administrator = administrator
    end

    def authenticate(raw_password)
        @administrator &&
        !@administrator.suspended? &&
            BCrypt::Password.new(@administrator.hashed_password) == raw_password
    end
end