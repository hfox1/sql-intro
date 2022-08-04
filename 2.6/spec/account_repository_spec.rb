require 'account_repository'

def reset_social_table
  seed_sql = File.read('spec/social_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_tests' })
  connection.exec(seed_sql)
end

RSpec.describe AccountRepository do 
  before(:each) do 
    reset_social_table
  end

  it 'Get all accounts' do
    repo =  AccountRepository.new 

    accounts = repo.all

    expect(accounts[0].email).to eq 'david@yahoo.com'
    expect(accounts[0].username).to eq 'big dave'
    expect(accounts.length).to eq 2
    expect(accounts[1].email).to eq 'janed@yahoo.com'
    expect(accounts[1].username).to eq 'jane'
  end

  it "finds a single account" do
    repo = AccountRepository.new

    account = repo.find(1)

    expect(account.email).to eq 'david@yahoo.com'
    expect(account.username).to eq 'big dave'

    account2 = repo.find(2)

    expect(account2.email).to eq 'janed@yahoo.com'
    expect(account2.username).to eq 'jane'
  end

  it "creates a single account" do

    repo = AccountRepository.new
    account = Account.new
    account.email = 'chris@aol.com'
    account.username = 'chrissyp'

    repo.create(account)

    expect(repo.all.length).to eq 3
  end


  it "Deletes a single account" do
    repo = AccountRepository.new
    repo.delete(1)
    expect(repo.all.length).to eq 1
  end

end