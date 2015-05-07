json.array!(@invitations) do |invitation|
  json.extract! invitation, :id, :nombre, :direccion, :telefono, :string, :correo, :numero_Adicional, :string, :responsable
  json.url invitation_url(invitation, format: :json)
end
