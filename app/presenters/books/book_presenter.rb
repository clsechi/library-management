# frozen_string_literal: true

module Books
  class BookPresenter
    def initialize(books:)
      @books = books
    end

    def attributes
      if books.is_a(Array)
        books.map do |book|
          mapper(book)
        end

      else
        mapper(books)
      end
    end

    private

    def mapper(book)
      book.to_h
    end

    attr_reader :books
  end
end
