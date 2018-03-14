# == Schema Information
#
# Table name: target_groups
#
#  id                :integer          not null, primary key
#  name              :string
#  external_id       :integer
#  parent_id         :integer
#  secret_code       :integer
#  panel_provider_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_target_groups_on_panel_provider_id  (panel_provider_id)
#

class TargetGroup < ActiveRecord::Base
  acts_as_tree order: 'name'

  belongs_to :panel_provider

  has_many :countries_target_groups
  has_many :countries, through: :countries_target_groups

  validates :panel_provider, presence: true
  validates :name, presence: true

  before_validation :set_panel_provider

  private

  def set_panel_provider
    self.panel_provider ||= parent.panel_provider if parent.present?
  end
end
