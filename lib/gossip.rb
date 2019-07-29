class Gossip
  attr_accessor :author, :content, :comments

  def initialize(author, content, comments = [])
    @author = author
    @content = content
    @comments = comments
  end
    
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end

    def self.all
      gossip_array = []
      CSV.read('db/gossip.csv').each do |csv|
        csv.length > 2 ? comments = csv[2...csv.length] : comments = []
        gossip_array << Gossip.new(csv[0], csv[1], comments)
      end
      gossip_array
    end
  end

end

