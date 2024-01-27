require "test_helper"

class PrototypeTest < ActiveSupport::TestCase
  validates :content, presence: true, unless: :was_attached?

  # test "the truth" do
  #   assert true
  # end
end
