module SessionsHelper
    def sign_in(usuario)
        session[:usuario_id] = usuario.id
    end

    def sign_out
        session.delete(:usuario_id)
    end

    def current_usuario
        @current_usuario ||= Usuario.find_by(id: session[:usuario_id])
    end

    def usuario_signed_in?
        !current_usuario.nil?
    end
end