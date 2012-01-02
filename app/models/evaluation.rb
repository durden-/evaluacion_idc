# == Schema Information
#
# Table name: evaluations
#
#  id              :integer         not null, primary key
#  incident        :string(255)
#  user_id         :integer
#  clarify         :string(255)
#  pregunta_uno    :boolean
#  pregunta_dos    :boolean
#  pregunta_tres   :boolean
#  pregunta_cuatro :boolean
#  notes           :text
#  created_at      :datetime
#  updated_at      :datetime
#

class Evaluation < ActiveRecord::Base
end
