class MicropubController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [ :create ]

  def show
    query_source if params[:q] == "source"
  end

  def create
    unless params[:h] == "entry"
      render json: { error: "Not supported h-value" }, status: :bad_request
      return
    end

    entry = Entry.create!(
      content: params[:content],
      published_at: Time.current
    )

    head :created, location: entry_url(entry)
  end

  private

  def query_source
    entry = entry_from_url(params[:url])

    unless entry
      render json: {
        error: "bad_request",
        error_description: "The url you provided does not match any entry."
      }, status: :bad_request
      return
    end

    properties = {
      content: [ entry.content ],
      published: [ entry.published_at.iso8601 ]
    }

    render json: { properties: }, status: :ok
  end

  def entry_from_url(url)
    id = URI.parse(url).path.split("/").last
    Entry.find_by(id:)
  end
end
