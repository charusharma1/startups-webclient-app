class Startup

attr_accessor :id, :name, :location, :job_openings

  def initialize(hash)
    @id = hash["id"]
    @name = hash["name"]
    @location = hash["location"]
    @job_openings = hash["job_openings"]
  end

  def self.all
    startups = []
    startup_hashes = Unirest.get("#{ENV['API_BASE_URL']}/startups.json").body
    startup_hashes.each do |startup_hash|
      startups << Startup.new(startup_hash)
    end
    return startups
  end

  def self.find(id)
    startup_hash = Unirest.get("#{ENV['API_BASE_URL']}/startups/#{id}.json").body
    Startup.new(startup_hash)
  end

  def delete
   Unirest.delete("#{ENV['API_BASE_URL']}/startups/#{@id}.json").body
    
  end


  def self.create(attributes)
    startup_hash = Unirest.post("#{ENV['API_BASE_URL']}/startups.json", headers: {"Accept" => "application/json"}, parameters: attributes).body
    Startup.new(startup_hash)
  end

  def edit

  end

  def update(attributes)
    startup_hash = Unirest.patch("#{ENV['API_BASE_URL']}/startups/#{id}.json", headers: {"Accept" => "application/json"}, parameters: attributes).body
    Startup.new(startup_hash)
  end

end