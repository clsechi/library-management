# frozen_string_literal: true

module Books
  class ListBookUseCase
    def initialize(params: {
      filters: {},
      pagination: {}
    })
      @filters = params[:filters]
      @pagination = params[:pagination]
    end

    def call!
      validate!

      find_books
    end

    private

    attr_reader :filters, :pagination

    def find_books
      Books::BookRepository.find_all(
        filters: filters,
        pagination: pagination
      )
    end
  end
end
