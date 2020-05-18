# frozen_string_literal: true

# BookList - list of books
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

  def sort_data
    @books = @books.sort do |book1, book2|
      book1.date <=> book2.date
    end
  end

  def books_reverse
    @books.reverse!
  end

  def get_by_year(select_year)
    month = []
    # pp select_year
    @books.each do |book|
      str = book.date.split('-')
      book_year = str[0]
      month << str[1] if book_year == select_year
    end
    month.sort!
    month.reverse!
    # pp month
    if month.empty?
      []
    else
      month.each_with_object(Hash.new(0)) { |i, a| a[i] += 1 }
    end
  end

  def years_books
    years = []
    @books.each do |book|
      str = book[:date].split('-')
      years << str[0]
    end
    years.sort!
    years.reverse!
    years.each_with_object(Hash.new(0)) { |i, a| a[i] += 1 }
  end
end
