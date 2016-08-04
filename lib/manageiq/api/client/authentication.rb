module ManageIQ
  module API
    class Client
      class Authentication
        include CustomInspectMixin

        attr_accessor :user
        attr_accessor :password
        attr_accessor :token
        attr_accessor :miqtoken
        attr_accessor :group

        DEFAULTS = {
          :user     => "admin",
          :password => "smartvm"
        }.freeze

        def initialize(options = {})
          custom_inspect_exclude(:password)

          @user, @password = fetch_credentials(options)
          @token, @miqtoken, @group = options.values_at(:token, :miqtoken, :group)

          unless token || miqtoken
            raise "Must specify both a user and a password" if user.blank? || password.blank?
          end
        end

        def self.auth_options_specified?(options)
          options.slice(:user, :password, :token, :miqtoken, :group).present?
        end

        private

        def fetch_credentials(options)
          if options.slice(:user, :password, :token, :miqtoken).blank?
            [DEFAULTS[:user], DEFAULTS[:password]]
          else
            [options[:user], options[:password]]
          end
        end
      end
    end
  end
end
