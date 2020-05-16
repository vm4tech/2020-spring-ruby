require 'roda'
require_relative 'models'

#documentation: 
class BooksApp < Roda
    opts[:root] = __dir__
    plugin :environments
    plugin :render
    
    configure :development do
        plugin :public
        opts[:serve_static] = true
      end
    
      opts[:books] = BooksList.new([
                                    
                                    Book.new('2004-03-12', 'Steve McConnell', 'Code Complete'),
                                    Book.new('1905-01-02', 'Jack2 London', 'Martin2 Iden'),
                                    Book.new('1905-01-01', 'Jack London', 'Martin Iden'),
                                    Book.new('2020-05-15', 'Molotkov Vlad', 'Test Test Test... Now Ruby Coding')
                                  ])

        route do |r|
        r.public if opts[:serve_static]
    
        r.root do
            r.redirect '/books'
        end
    
        r.on 'books' do
            r.is do
            
            # @params = InputValid.check_date_author_book_name("2000-01-01", "book.author", "book.book_name")
            # opts[:books] do |book|
            #     @params = InputValid.check_date_author_book_name(book.date, book.author, book.book_name)
            # end
            opts[:books].sort_data()
            @sorted_books = opts[:books].all_book
            view('books')
            end
    
            r.on 'new' do
                r.get do
                    view('book_add')
                end
            
                r.post do
                    @params = InputValid.check_date_author_book_name(r.params['date'], r.params['author'], r.params['book_name'])
                    if @params[:errors].empty?
                        opts[:books].add_book(Book.new(@params[:date], @params[:author], @params[:book_name]))
                        r.redirect '/books'
                    else
                        view('book_add')
                    end
                end
            end
            
            r.on 'stat' do
                r.get do
                    view('statist')
                end
            end
        end
    
    end
                                
end