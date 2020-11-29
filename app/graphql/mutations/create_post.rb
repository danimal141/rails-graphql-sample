module Mutations
  class CreatePost < BaseMutation
    field :post, Types::PostType, null: true
    field :result, Boolean, null: true

    argument :title, String, required: true
    argument :description, String, required: true

    def resolve(**args)
      post = Post.create(title: args[:title], description: args[:description])
      {
        post: post,
        errors: post.errors
      }
    end
  end
end
