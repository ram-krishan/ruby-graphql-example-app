class Types::MutationType < Types::BaseObject
  graphql_name "Mutation"

  field :deleteUser, mutation: Mutations::DeleteUser
  field :updateUser, mutation: Mutations::UpdateUser
  field :createUser, mutation: Mutations::CreateUser
end
