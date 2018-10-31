class SpaceAge

  EARTH_ORBITAL_PERIOD_SECONDS = 31557600.0

  def initialize(age_in_seconds)
    @age_in_seconds = age_in_seconds.to_f

    percentage_of_earth_orbital_period = {
      mercury: 24.08467,
      venus: 61.519726,
      earth: 100.0,
      mars: 188.08158,
      jupiter: 1186.2615,
      saturn: 2944.7498,
      uranus: 8401.6846,
      neptune: 16479.132
    }

    percentage_of_earth_orbital_period.each do |planet, percent_of_earth_orbital_period|
      define_singleton_method("on_#{planet}") { age_in_years_relative_to_earth_time(percent_of_earth_orbital_period)}
    end
  end

  def age_in_years_relative_to_earth_time(percent_of_earth_orbital_period)
    @age_in_seconds / ( EARTH_ORBITAL_PERIOD_SECONDS * (percent_of_earth_orbital_period/100.0))
  end
end
