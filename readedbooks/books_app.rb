# frozen_string_literal: true

require 'roda'
require_relative 'models'

# documentation:
class BooksApp < Roda
  opts[:root] = __dir__
  plugin :environments
  plugin :render

  configure :development do
    plugin :public
    opts[:serve_static] = true
  end

  opts[:books] = BooksList.new([Book.new('2004-03-12', 'Steve McConnell', 'Code Complete', 'бумажная книга', '676', '5', 'good book'),
                                Book.new('2005-12-12', 'What Author?', 'Code Error', 'бумажная книга', '676', '5', 'good book'),
                                Book.new('1995-05-21', 'Jack Harlow', 'Issa', 'бумажная книга', '676', '5', 'good book'),
                                Book.new('2000-07-12', 'Vladislav Molotkov', 'My Birthday', 'бумажная книга', '676', '5', 'good book'),
                                Book.new('2019-10-11', 'Hello World', 'Hello!', 'бумажная книга', '676', '5', 'good book'),
                                Book.new('2018-11-11', 'McDonalds', 'How eat Hamburger', 'электронная книга', '676', '5', 'good book'),

                                Book.new('1000-01-05', '1000 year', '01-05', 'электронная книга', '676', '5', 'good book'),
                                Book.new('0999-05-01', '999 year', '05-01', 'электронная книга', '676', '5', 'good book'),
                                Book.new('0998-06-31', '31 day of 998', '06-31', 'электронная книга', '676', '5', 'good book'),

                                Book.new('1001-01-05', '1001 year', '01-05', 'электронная книга', '676', '5', 'good book'),
                                Book.new('1999-05-01', '1999 year', '05-01', 'электронная книга', '676', '5', 'good book'),
                                Book.new('1998-06-31', 'day of 1998', '06-31', 'аудиокнига', '676', '5', 'good book'),
                                Book.new('1001-01-05', '1001 year', '01-05', 'аудиокнига', '676', '5', 'good book'),
                                Book.new('0999-07-01', '9sssss99 year', '05-01', 'аудиокнига', '676', '5', 'good book'),
                                Book.new('0998-08-31', '31 day of 998', '06-31', 'аудиокнига', '676', '5', 'good book'),

                                Book.new('1905-01-01', 'Jack London', 'Martin Iden', 'аудиокнига', '676', '5', 'good book'),
                                Book.new('1905-01-01', 'Jack London', 'Martin Iden', 'аудиокнига', '676', '5', 'good book'),
                                Book.new('1905-01-01', 'Jack London', 'Martin Iden', 'аудиокнига', '676', '5', 'good book'),
                                Book.new('1905-01-01', 'Jack London', 'Martin Iden', 'аудиокнига', '676', '5', 'good book'),
                                Book.new('1905-01-01', 'Jack London', 'Martin Iden', 'аудиокнига', '676', '5', 'good book'),
                                Book.new('1905-01-01', 'Jack London', 'Martin Iden', 'аудиокнига', '676', '5', 'good book'),

                                Book.new('2020-05-15', 'Molotkov Vlad', 'Test Test Test... Now Ruby Coding', 'аудиокнига', '676', '5', 'good book')])

  route do |r|
    r.public if opts[:serve_static]

    r.root do
      r.redirect '/books'
    end

    r.on 'books' do
      r.is do
        opts[:books].sort_data
        opts[:books].books_reverse
        @years = opts[:books].years_books
        @form_read = r.params['form_read']
        pp @form_read
        # if @form_read.empty?
        @sorted_books = opts[:books].all_book
        pp @sorted_books
        view('books')
        # else
        #   @sorted_books = opts[:books].sort_form_read(@form_read)
        #   pp @sorted_books
        #   view('books')
        # end
      end

      r.on 'new' do
        r.get do
          view('book_add')
        end

        r.post do
          @params = InputValid.check_date_author_book_name(r.params['date'], r.params['author'], r.params['book_name', r.params['mark'], r.params['form_read']])
          if @params[:errors].empty?
            pp @params[:errors]
            opts[:books].add_book(Book.new(@params[:date], @params[:author], @params[:book_name], @params[:mark], @params[:form_read]))
            r.redirect '/'
          else
            view('book_add')
          end
        end
      end

      r.on 'stat' do
        r.get do
          @years = opts[:books].years_books
          pp @years
          @select_year = r.params['year']
          # pp @select_year
          @month = opts[:books].get_by_year(@select_year)
          if @month.empty?
            # pp @month.length
            @select_year = ''
            # pp @month

          end
          view('statist')
        end
      end
    end
  end
end
