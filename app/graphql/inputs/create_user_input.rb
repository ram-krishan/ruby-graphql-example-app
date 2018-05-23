class Inputs::CreateUserInput < GraphQL::Schema::InputObject
  graphql_name 'CREATE_USRE_INPUT'

  argument :first_name, String, 'First name of user', required: true
  argument :last_name, String, 'Last name of user', required: true
  argument :email, String, 'Email', required: true
  argument :mobile_number, String, required: false
  argument :password, String, required: true
end