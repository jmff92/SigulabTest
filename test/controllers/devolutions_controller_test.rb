require 'test_helper'

class DevolutionsControllerTest < ActionController::TestCase
  setup do
    @devolution = devolutions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:devolutions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create devolution" do
    assert_difference('Devolution.count') do
      post :create, devolution: { autorizacion: @devolution.autorizacion, carencia: @devolution.carencia, certificacion: @devolution.certificacion, contacto: @devolution.contacto, copia: @devolution.copia, datos: @devolution.datos, direccion: @devolution.direccion, discriminado: @devolution.discriminado, disponibilidad: @devolution.disponibilidad, factura: @devolution.factura, firma: @devolution.firma, foto: @devolution.foto, idioma: @devolution.idioma, informe: @devolution.informe, nombre: @devolution.nombre, numAutorizacion: @devolution.numAutorizacion, numCertificacion: @devolution.numCertificacion, numInforme: @devolution.numInforme, numOtro: @devolution.numOtro, numRegistro: @devolution.numRegistro, numRequisicion: @devolution.numRequisicion, numSolicitud: @devolution.numSolicitud, observaciones: @devolution.observaciones, otro: @devolution.otro, otroCarencia: @devolution.otroCarencia, persona: @devolution.persona, requisicion: @devolution.requisicion, rif: @devolution.rif, solicitud: @devolution.solicitud, telefonos: @devolution.telefonos, unidadSolicitante: @devolution.unidadSolicitante }
    end

    assert_redirected_to devolution_path(assigns(:devolution))
  end

  test "should show devolution" do
    get :show, id: @devolution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @devolution
    assert_response :success
  end

  test "should update devolution" do
    patch :update, id: @devolution, devolution: { autorizacion: @devolution.autorizacion, carencia: @devolution.carencia, certificacion: @devolution.certificacion, contacto: @devolution.contacto, copia: @devolution.copia, datos: @devolution.datos, direccion: @devolution.direccion, discriminado: @devolution.discriminado, disponibilidad: @devolution.disponibilidad, factura: @devolution.factura, firma: @devolution.firma, foto: @devolution.foto, idioma: @devolution.idioma, informe: @devolution.informe, nombre: @devolution.nombre, numAutorizacion: @devolution.numAutorizacion, numCertificacion: @devolution.numCertificacion, numInforme: @devolution.numInforme, numOtro: @devolution.numOtro, numRegistro: @devolution.numRegistro, numRequisicion: @devolution.numRequisicion, numSolicitud: @devolution.numSolicitud, observaciones: @devolution.observaciones, otro: @devolution.otro, otroCarencia: @devolution.otroCarencia, persona: @devolution.persona, requisicion: @devolution.requisicion, rif: @devolution.rif, solicitud: @devolution.solicitud, telefonos: @devolution.telefonos, unidadSolicitante: @devolution.unidadSolicitante }
    assert_redirected_to devolution_path(assigns(:devolution))
  end

  test "should destroy devolution" do
    assert_difference('Devolution.count', -1) do
      delete :destroy, id: @devolution
    end

    assert_redirected_to devolutions_path
  end
end
