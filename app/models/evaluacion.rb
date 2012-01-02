# == Schema Information
#
# Table name: evaluacions
#
#  id              :integer         not null, primary key
#  incidente       :string(255)
#  user_id         :integer
#  clarify         :string(255)
#  pregunta_uno    :boolean
#  pregunta_dos    :boolean
#  pregunta_tres   :boolean
#  pregunta_cuatro :boolean
#  comentarios     :text
#  created_at      :datetime
#  updated_at      :datetime
#

class Evaluacion < ActiveRecord::Base
end
