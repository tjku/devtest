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
  has_many :countries
  has_many :target_groups
  has_many :location_groups

  validates :code, presence: true,
                   uniqueness: true
end
