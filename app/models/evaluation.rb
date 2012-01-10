# == Schema Information
#
# Table name: evaluations
#
#  id              :integer         primary key
#  incident        :string(255)
#  user_id         :integer
#  clarify         :string(255)
#  pregunta_uno    :boolean
#  pregunta_dos    :boolean
#  pregunta_tres   :boolean
#  pregunta_cuatro :boolean
#  notes           :text
#  created_at      :timestamp
#  updated_at      :timestamp
#

class Evaluation < ActiveRecord::Base

  attr_accessible :incident, :clarify, :pregunta_uno, :pregunta_dos, :pregunta_tres, :pregunta_cuatro, :notes

  belongs_to :user

  incident_regex = /IM\d{7}/
  clarify_regex = /\d{6}-\d{1,6}/

  validates :incident, :presence => true,
                       :format => { :with => incident_regex }
  validates :clarify, :presence => true,
                      :format => { :with => clarify_regex },
                      :uniqueness => true
  validates :user_id, :presence => true
end
