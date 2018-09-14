class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def comments_attributes=(comments_attributes)
    comments_attributes.values.each do |comment_attribute|
      if comment_attribute[:content].present?
        comment = comement.find_or_create_by(comment_attribute)

        if !self.comments.include?(comment)
          self.post_comments.build(comment: comment)
        end
      end
    end
  end
end
