# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  en         :string
#  es         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  has_many :products
end
