class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    # validates_with ClickbaitValidator
    validate :clickbait

    def clickbait
        # if title.include?("Won't Believe")
        if title.present? && title.include?("Won't Believe")
        else errors.add(:title, "You must add pizazz to your title!")
        end
        
        # unless title.include?( "Won't Believe")
        #     errors.add(:title, "You must add pizazz to your title!")
        # end
    end

end

# class ClickbaitValidator < ActiveModel::Validator
#     def validate(record)
#         if record.title.include?("Won't Believe")
#         else
#             record.errors.add :base, "You must add pizazz to your title!"
#         end
#     end
# end