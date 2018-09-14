class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: :all_blank || :no_comment

  def no_comment
    !!self.blank?
  end
end
