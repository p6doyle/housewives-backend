class HousewifeSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :city, :image, :current, :seasons, :taglines

  def taglines
    self.object.taglines.map do |tagline_obj|
      num = tagline_obj.season.season
      {num => tagline_obj.tagline}
    end
  end

  def city
    season = self.object.seasons.first
    if season
      return season.city
    else
      return nil
    end
  end

  def seasons
    self.object.seasons.map do |season_obj|
      season_obj.season
    end
  end


end
