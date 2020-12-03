require 'test_helper'

class CuidadorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cuidador = cuidadors(:one)
  end

  test "should get index" do
    get cuidadors_url, as: :json
    assert_response :success
  end

  test "should create cuidador" do
    assert_difference('Cuidador.count') do
      post cuidadors_url, params: { cuidador: { cpf: @cuidador.cpf, datanasc: @cuidador.datanasc, email: @cuidador.email, nome: @cuidador.nome, password_digest: @cuidador.password_digest, sexo: @cuidador.sexo, telefone: @cuidador.telefone } }, as: :json
    end

    assert_response 201
  end

  test "should show cuidador" do
    get cuidador_url(@cuidador), as: :json
    assert_response :success
  end

  test "should update cuidador" do
    patch cuidador_url(@cuidador), params: { cuidador: { cpf: @cuidador.cpf, datanasc: @cuidador.datanasc, email: @cuidador.email, nome: @cuidador.nome, password_digest: @cuidador.password_digest, sexo: @cuidador.sexo, telefone: @cuidador.telefone } }, as: :json
    assert_response 200
  end

  test "should destroy cuidador" do
    assert_difference('Cuidador.count', -1) do
      delete cuidador_url(@cuidador), as: :json
    end

    assert_response 204
  end
end
