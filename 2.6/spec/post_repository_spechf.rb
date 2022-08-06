require 'post_repository'

def reset_social_table
  seed_sql = File.read('spec/social_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_tests' })
  connection.exec(seed_sql)
end

RSpec.describe PostRepository do
  before(:each) do 
    reset_social_table
  end

  it "gets all posts" do
    repo =  PostRepository.new 

    posts = repo.all

    expect(posts[0].title).to eq 'tuesday'
    expect(posts[0].content).to eq 'gregs'
    expect(posts[0].views).to eq '24'
    expect(posts[0].account_id).to eq '1'

    expect(posts.length).to eq 2

    expect(posts[1].title).to eq 'wednesday'
    expect(posts[1].content).to eq 'gregs2'
    expect(posts[1].views).to eq '10'
    expect(posts[1].account_id).to eq '2'
  end


  it "Finds a single post" do
    repo =  PostRepository.new 
    
    post = repo.find(1)

    expect(post.title).to eq 'tuesday'
    expect(post.content).to eq 'gregs'
    expect(post.views).to eq '24'
    expect(post.account_id).to eq '1'

    post = repo.find(2)

    expect(post.title).to eq 'wednesday'
    expect(post.content).to eq 'gregs2'
    expect(post.views).to eq '10'
    expect(post.account_id).to eq '2'
  end

  it "Creates a single post where there is an existing account" do

    repo = PostRepository.new
    post = Post.new

    post.title = 'thursday'
    post.content = 'gregs3'
    post.views = '10000'
    post.account_id = '2'
    repo.create(post)

    post.title = 'thursday'
    post.content = 'gregs3'
    post.views = '10000'
    post.account_id = '1'
    repo.create(post)

    expect(repo.all.length).to eq 4
  end

  it "Deletes a single post" do
    repo = PostRepository.new
    repo.delete(1)
    expect(repo.all.length).to eq 1
  end

  it "updates a single post value" do 
    repo = PostRepository.new
    post = repo.all[0]

    post.views = '241'

<<<<<<< HEAD
    repo.update(post, "views")
=======
    repo.update('posts', 1, 'views', post.views)
>>>>>>> aec0033 (-> 3.4) done)
    
    expect(post.title).to eq 'tuesday'
    expect(post.content).to eq 'gregs'
    expect(post.views).to eq '241'
    expect(post.account_id).to eq '1'
  end

end