class ApplicationController < ActionController::API
      def not_found
        render json: { error: 'not_found' }
      end
    
      def authorize_request_cuidador
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
          @decoded = JsonWebToken.decode(header)
          @current_cuidador = Cuidador.find(@decoded[:cuidador_id])
        rescue ActiveRecord::RecordNotFound => e
          render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
          render json: { errors: e.message }, status: :unauthorized
        end
      end
    end

    def teste
    end

    def authorize_request_funcionario
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      begin
        @decoded = JsonWebToken.decode(header)
        @current_funcionario = Funcionario.find(@decoded[:funcionario_id])
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
      rescue JWT::DecodeError => e
        render json: { errors: e.message }, status: :unauthorized
      end
    end
  
  
  def teste2
  end

  #eyJhbGciOiJIUzI1NiJ9.eyJjdWlkYWRvcl9pZCI6MSwiZXhwIjoxNjA3MTA1NjU2fQ.8g3-8rnoJDyBfTaKZbNWflOrbpd5sgBd9q84YdqZWdk
  #eyJhbGciOiJIUzI1NiJ9.eyJmdW5jaW9uYXJpb19pZCI6MSwiZXhwIjoxNjA3MTA1ODU1fQ.276DR9tXFiELGvmRYpHZSsb4SKbz5zmuO63EEwM1oYk