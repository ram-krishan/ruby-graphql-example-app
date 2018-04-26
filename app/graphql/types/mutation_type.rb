Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  # TODO: Remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "mutation Hello World!"
    }
  end

  #delete user.
  field :deleteUser, Types::UserType do
    argument :id, types.Int
    description "User delete"
    resolve ->(obj, args, ctx) { User.find(args.id).destroy }
  end

  #delete user.
  field :createUser, Types::UserType do
    argument :first_name, !types.String
    argument :last_name, !types.String
    argument :email, !types.String
    argument :mobile_number, types.String
    argument :password, !types.String

    description "Create user"
    resolve ->(obj, args, ctx)  do
      User.create!(args.to_h)
    end
  end

    #delete user.
  field :updateUser, Types::UserType do
    argument :id, !types.Int
    argument :first_name, types.String
    argument :last_name, types.String
    argument :email, types.String
    argument :mobile_number, types.String
    argument :password, types.String

    description "Update user"
    resolve ->(obj, args, ctx)  do
      user = User.find(args.id)
      user.update(args.to_h)
      user
    end
  end
end
