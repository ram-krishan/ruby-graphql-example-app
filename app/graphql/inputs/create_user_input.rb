Inputs::CreateUserInput = GraphQL::InputObjectType.define do
  name 'CREATE_USRE_INPUT'

  argument :first_name, !types.String
  argument :last_name, !types.String
  argument :email, !types.String
  argument :mobile_number, types.String
  argument :password, !types.String
end