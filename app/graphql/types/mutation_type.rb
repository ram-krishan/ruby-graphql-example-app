Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :deleteUser, Mutations::DeleteUser.field
  field :updateUser, Mutations::UpdateUser.field
  field :createUser, Mutations::CreateUser.field
end
