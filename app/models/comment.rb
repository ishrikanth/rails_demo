class Comment < ApplicationRecord
   belongs_to :article, required: false

end
