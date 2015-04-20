class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :CampaignID
      t.string :CampaignName
      t.string :Impressions
      t.string :Clicks
      t.string :CTR
      t.string :Spend

      t.timestamps null: false
    end
  end
end
