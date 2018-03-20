class AuthRedirect
    def self.matches?(request)
        request.subdomain.present? && request.subdomain == 'auth'
    end
end
