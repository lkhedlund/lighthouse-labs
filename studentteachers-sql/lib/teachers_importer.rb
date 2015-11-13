class TeachersImporter

  def import

    Teacher.create do |t|
      t.name = "George Grant"
      t.email = "grant@college.ca"
      t.address = "Blackfoot Trail"
      t.phone = "200-0001"
    end

    Teacher.create do |t|
      t.name = "Steven Smith"
      t.email = "smith@college.ca"
      t.address = "Blackfoot Trail"
      t.phone = "200-0002"
    end

    Teacher.create do |t|
      t.name = "Chester Cat"
      t.email = "chester@college.ca"
      t.address = "Blackfoot Trail"
      t.phone = "200-0003"
    end

    Teacher.create do |t|
      t.name = "Pierre Portois"
      t.email = "portois@college.ca"
      t.address = "Blackfoot Trail"
      t.phone = "200-0004"
    end

    Teacher.create do |t|
      t.name = "Richard Renee"
      t.email = "renee@college.ca"
      t.address = "Blackfoot Trail"
      t.phone = "200-0005"
    end

    Teacher.create do |t|
      t.name = "Olana Olsen"
      t.email = "olsen@college.ca"
      t.address = "Blackfoot Trail"
      t.phone = "200-0006"
    end

    Teacher.create do |t|
      t.name = "Seb Salburg"
      t.email = "salburg@college.ca"
      t.address = "Blackfoot Trail"
      t.phone = "200-0007"
    end

    Teacher.create do |t|
      t.name = "Bruce Banner"
      t.email = "banner@college.ca"
      t.address = "Blackfoot Trail"
      t.phone = "200-0008"
    end

    Teacher.create do |t|
      t.name = "Peter Parker"
      t.email = "parker@college.ca"
      t.address = "Blackfoot Trail"
      t.phone = "200-0009"
    end
  end

end
