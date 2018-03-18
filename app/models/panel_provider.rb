# == Schema Information
#
# Table name: panel_providers
#
#  id         :integer          not null, primary key
#  code       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_panel_providers_on_code  (code) UNIQUE
#

class PanelProvider < ActiveRecord::Base
  has_many :countries, dependent: :destroy
  has_many :target_groups, dependent: :destroy
  has_many :location_groups, dependent: :destroy

  validates :code, presence: true,
                   uniqueness: true
end
