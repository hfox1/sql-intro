require 'tag_repository'

def reset_albums_table
  seed_sql = File.read('spec/seeds_posts_tags.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'blogs_posts_tags_test' })
  connection.exec(seed_sql)
end


RSpec.describe PostRepository do 
  before(:each) do 
    reset_albums_table
  end

 it "find_by_post takes a post, returns tag object(s)" do 
    repo = TagRepository.new
    tags = repo.find_by_post ('How to FINALLY use up those leeches')
    expect(tags[0].name).to eq "huntsman tips"
    expect(tags[1].name).to eq "niche"
    
  end




end 