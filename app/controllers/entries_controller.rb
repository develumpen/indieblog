class EntriesController < ApplicationController
  before_action :set_entry, only: [ :show ]

  def index
    @entries = Entry.order(published_at: :desc)
  end

  def show
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end
end
