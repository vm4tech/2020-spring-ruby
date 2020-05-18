# frozen_string_literal: true

# this module is check validation of inputs
module InputValid
  def self.check_date_author_book_name(el_date, el_author, el_book_name)
    date = el_date || ''
    author = el_author || ''
    book_name = el_book_name || ''
    # pp date
    # pp author
    # pp book_name
    errors = [].concat(check_author(author))
               .concat(check_date_format(date))
               .concat(chek_book_name(book_name))
    {
      date: date,
      author: author,
      book_name: book_name,
      errors: errors
    }
  end

  def self.check_date_format(date)
    if /\d{4}-\d{2}-\d{2}/ =~ date
      str_date = date.split('-')
      if str_date[0].to_i.positive? && str_date[0].to_i <= 2020
        if str_date[1].to_i.positive? && str_date[1].to_i <= 12
          if str_date[2].to_i.positive? && str_date[2].to_i <= 31
            []
          else
            ['День должен быть 0 < x < 32']
          end
        else
          ['Месяц должен быть 0 < x < 13']
        end
      else
        ['Год должен быть 0 < x < 2021']
      end
    else
      ['Дата должна быть передана в формате ГГГГ-ММ-ДД']
    end
  end

  def self.check_author(el_author)
    if el_author.empty?
      ['У каждой книги есть автор. У вашей - нет.']
    else
      []
    end
  end

  def self.chek_book_name(el_book_name)
    if el_book_name.empty?
      ['У каждой книги есть название. У вашей - нет.']
    else
      []
    end
  end
end
