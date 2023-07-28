class Library
  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name = name 
    @books = []
    @authors = []
  end
  
  def add_author(author)
    @authors << author
    
    author.books.map do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    earliest = author.books.min_by do |book|
      book.publication_year.to_i 
    end
    latest = author.books.max_by do |book|
      book.publication_year.to_i
    end

    {start: earliest.publication_year, end: latest.publication_year}
  end
end