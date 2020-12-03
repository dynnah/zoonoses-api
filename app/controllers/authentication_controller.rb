class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    @cuidador = Cuidador.find_by_email(params[:email])
    @funcionario = Funcionario.find_by_email(params[:email])
    if @cuidador&.authenticate(params[:password])
      token = JsonWebToken.encode(cuidador_id: @cuidador.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     email: @cuidador.email }, status: :ok
    elsif @funcionario&.authenticate(params[:password])
      token = JsonWebToken.encode(funcionario_id: @funcionario.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                   email: @funcionario.email }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
