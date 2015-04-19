namespace "concerts" do
  desc "Add new concerts from cheapthrills.ca"
  task add: :environment do
    concert_listing = ConcertListingScraper.new.to_a
    ConcertParser.save_all(concert_listing)
  end
end
