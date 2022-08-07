require 'post_repository'

def reset_albums_table
  seed_sql = File.read('spec/seeds_posts_tags.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'blogs_posts_tags_test' })
  connection.exec(seed_sql)
end


RSpec.describe PostRepository do 
  before(:each) do 
    reset_albums_table
  end

 it "find_with_tag takes a tag, returns post object(s)" do 
    repo = PostRepository.new
    posts = repo.find_with_tag('niche')
    expect(posts[0].id).to eq "1"
    expect(posts[1].id).to eq "3"
    
  end




end 