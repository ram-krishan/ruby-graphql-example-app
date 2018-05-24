class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  #listing all the users.
  #I am not able to move this into separate file because of return type should not be array.
  # need to check more on this.
  # field :users, types[Types::UserType] do
  #   argument :page, types.Int, default_value: 1
  #   argument :per_page, types.Int, default_value: 20

  #   description "User List"
  #   resolve ->(obj, args, ctx) do
  #     User.page(args.page).per(args.per_page)
  #   end
  # end

  #user detail
  field :user, type: Types::UserType,  null: true do
    argument :id, Integer, required: true
  end

  def user(id:)
    User.find(id)
  end

  #user detail
  #field :user_profile, type: Types::UserType, resolve: ->(obj, args, ctx) { ctx[:current_user]  }, null: false
  field :user_profile, function: Functions::UserProfile.new


  # {
  #   users(first: 10, after: endCursor|startCursor) {
  #      pageInfo {
  #        endCursor
  #        startCursor
  #        hasNextPage
  #        hasPreviousPage
  #      },
  #      edges {
  #        node {
  #          id,
  #          first_name
  #          last_name
  #          full_name
  #          email
  #          votes {
  #            id
  #          }
  #        }
  #      },
  #   }
  #  }
  #pagination on user list using graphQL.
  # http://graphql-ruby.org/relay/connections.html
  field :users, Types::UserType.connection_type, max_page_size: 10, null: true, connection: true

  def users
    User.all
  end
end
