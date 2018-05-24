class Types::Inputs::UpdateUserInput < Types::BaseInputObject
  graphql_name 'UPDATE_USRE_INPUT'

  argument :id, Integer, 'user id', required: true
  argument :first_name, String, 'First name of user', required: false
  argument :last_name, String, 'Last name of user', required: false
  argument :email, String, 'Email', required: false
  argument :mobile_number, String, required: false
  argument :password, String, required: false
end