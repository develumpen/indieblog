class MicropubController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [ :create ]

  def create
    unless params[:h] == "entry"
      render json: { error: "Not supported h-value" }, status: :invalid_request
      return
    end

    Entry.create!(
      content: params[:content],
      published_at: Time.current
    )

    head :created, location: entry_url(entry)
  end
end
