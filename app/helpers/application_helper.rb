module ApplicationHelper

  #Return a title on a per-page basis
  def title
    base_title= "Evaluacion de los ingenieros de Campo | CNOC"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
    image_tag("cnoc.png", :alt => "Evaluacion IDC", :class => "round")
  end
end
