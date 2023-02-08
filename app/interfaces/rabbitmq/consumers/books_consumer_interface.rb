# frozen_string_literal: true

module Rabbitmq
  module Consumers
    module BooksConsumerInterface
      include Errors::Handlers::Rabbitmq::Raised

      def create!(msg)
        Books::CreateBookUseCase.new(
          title: msg[:title],
          author: msg[:author],
          year: msg[:year],
          quantity: msg[:quantity]
        ).call!
      end

      def update!(msg)
        Books::UpdateBookUseCase.new(
          id: msg[:id],
          title: msg[:title],
          quantity: msg[:quantity]
        ).call!
      end
    end
  end
end
