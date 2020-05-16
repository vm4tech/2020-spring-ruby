class BooksList
    def initialize(books = [])
    @books = books
    end

    def add_book(book)
        @books.append(book)
    end

    def all_book
        @books.dup
      end

    def sort_data()
        @books = @books.sort do |book1, book2|
          book1.date <=> book2.date
        end
        pp @books
    end
    
end