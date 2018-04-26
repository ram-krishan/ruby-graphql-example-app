Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :deleteUser, Mutations::DeleteUser.field
  field :updateUser, Mutations::UpdateUser.field
  field :createUser, Mutations::CreateUser.field
  # TODO: Remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "mutation Hello World!"
    }
  end
end
