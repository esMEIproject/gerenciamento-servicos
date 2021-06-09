class ApplicationController < ActionController::Base
    include SessionsHelper

    private
    def require_logged_in_user
        unless usuario_signed_in?
            flash[:danger] = 'area restrita'
            redirect_to entrar_path
        end
    end
end
