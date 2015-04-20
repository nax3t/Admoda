class CampaignsController < ApplicationController
  before_action :set_campaign, only: []

  def index

  end

  def search
    if params[:q]
      @campaigns = Campaign.search(params[:q])
    else
      @campaigns = Campaign.all
    end
  end

  def admoda
    require 'csv'

    request = Typhoeus::Request.new("https://api.admoda.com/v1/advertiser/stats/campaigns.csv?from_date=2015-03-01&to_date=2015-03-11",
    # request = Typhoeus::Request.new("url2 = 'https://api.admoda.com/v1/advertiser/stats/ads.csv?from_date=2015-03-01&to_date=2015-03-11&campaign_id=184622",
                                    method: :get,
                                    headers: { 'Authorization' => ENV['admoda_token'] })
    response = request.run
    # puts response.body

    # dataframe = CSV.read(response.body, headers:true)

    csv_text = response.body
    @csv = CSV.parse(csv_text, :headers => true)
    # # csv.each do |row|
    # #   # Campaign.create(campaign_name: row['Campaign Name'])
    # #   puts row.inspect
    # #   puts row['Campaign Name']
    # # end
  end

  # def mmedia
  # end


end
