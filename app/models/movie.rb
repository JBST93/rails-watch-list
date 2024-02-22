class Movie < ApplicationRecord
  has_many :lists, :through => :bookmarks
  has_many :bookmarks

end
