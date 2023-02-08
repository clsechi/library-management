# frozen_string_literal: true

class BooksController < ApplicationController
  include Errors::Handlers::Http::Raised

  def index
    books = Books::ListBookUseCase.new(index_params).call!
    result = Books::BookPresenter.new(books: books).attributes

    render(json: result, status: :ok)
  end

  def show
    book = Books::FindBookUseCase.new(show_params).call!
    result = Books::BookPresenter.new(books: book).attributes

    render(json: result, status: :ok)
  end

  def create
    book = Books::CreateBookUseCase.new(create_params).call!
    result = Books::BookPresenter.new(books: book).attributes

    render(json: result, status: :created)
  end

  def update
    book = Books::UpdateBookUseCase.new(update_params).call!
    result = Books::BookPresenter.new(books: book).attributes

    render(json: result, status: :ok)
  end

  private

  def index_params
    params.permit(:filters, :pagination)
  end

  def show_params
    params.permit(:id)
  end

  def create_params
    params.permit(:title, :author, :year, :quantity)
  end

  def update_params
    params.permit(:id, :title, :quantity)
  end
end
