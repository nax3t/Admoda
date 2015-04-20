class CampaignsController < ApplicationController
  before_action :set_campaign, only: []

  def index
  end

  def search
    if params[:q]
      @campaigns = Campaign.search(params[:q])
    else
      @campaigns = Cmpaign.all
    end
  end

  def admoda
    start_date = params[:start_date]
    end_date = params[:end_date]


    require 'csv'

    request = Typhoeus::Request.new("https://api.admoda.com/v1/advertiser/stats/campaigns.csv?from_date="+start_date+"&to_date="+end_date,
    # request = Typhoeus::Request.new("url2 = 'https://api.admoda.com/v1/advertiser/stats/ads.csv?from_date=2015-03-01&to_date=2015-03-11&campaign_id=184622",
                                    method: :get,
                                    headers: { 'Authorization' => ENV['admoda_token'] })
    response = request.run

    csv_text = response.body
    @csv = CSV.parse(csv_text, :headers => true)

  end

  # def mmedia
  # end


end
