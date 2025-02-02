module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :post, Types::PostType, null: true
    def post
      Loaders::RecordLoader.for(Post).load(object.post_id)
    end
  end
end
