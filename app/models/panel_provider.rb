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
  validates :code, presence: true,
                   uniqueness: true
end
