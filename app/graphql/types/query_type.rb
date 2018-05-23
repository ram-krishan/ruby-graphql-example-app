Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
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
  field :user, Queries::UserDetail, type: Types::UserType

  #user detail
  field :userProfile, Queries::UserProfile, type: Types::UserType



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
  connection :users, Types::UserType.connection_type, max_page_size: 10 do
    # Return an Array or ActiveRecord::Relation
    resolve ->(obj, args, ctx) {
      User.all
    }
  end
end
