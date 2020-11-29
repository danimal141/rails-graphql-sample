module Types
  class QueryType < Types::BaseObject
    field :posts, Types::PostType.connection_type, null: false
    def posts
      Post.all.order(id: :desc)
    end

    field :post, Types::PostType, null: false do
      argument :id, Int, required: true
    end
    def post(id:)
      Post.find(id)
    end
  end
end
