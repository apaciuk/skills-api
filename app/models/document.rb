class Document < ApplicationRecord
attr_accessor :title, :author, :content

def initialize(title, author, content)
@title = title
@author = author
@content = content
end

def words
@content.split
end

def word_count
words.size
end 

def save
    raise DocumentException.new(self) unless valid?
        super
    end
end

end
