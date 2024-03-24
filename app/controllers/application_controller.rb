class ApplicationController < ActionController::Base
    before_action :set_locale

    helper_method :current_user

    def current_user
        @current_user ||= User.find_by(id: session[:id]) if session[:id]
    end

    def change_language
        session[:locale] = params[:locale]
        redirect_back(fallback_location: root_path)
    end

    private

    def set_locale
        I18n.locale = session[:locale] || I18n.default_locale
    end
end
