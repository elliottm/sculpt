class Comment

  include DataMapper::Resource

  property :id, Serial # Serial means that it will be auto-incremented for every record
  property :useremail, String
  property :body, String
  property :created_at, String
  property :forum, String


  def self.madmax
  	all(:forum => "madmax", :order => [ :created_at.desc ])
  end

  def self.donatello
  	all(:forum => "donatello", :order => [ :created_at.desc ])
  end

  def self.upcoming
  	all(:forum => "upcoming", :order => [ :created_at.desc ])
  end
  
end