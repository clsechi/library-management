# frozen_string_literal: true

module Books
  class FindBookUseCase
    include ActiveModel::Validations

    validates :id, presence: true

    def initialize(params: {
      id: nil
    })
      @id = params[:id]
    end

    def call!
      validate!

      find_book!
    end

    private

    attr_reader :id

    def find_book!
      Books::BookRepository.find!(
        id: id
      )
    end
  end
end
