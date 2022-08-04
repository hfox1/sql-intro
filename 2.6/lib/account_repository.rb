require_relative 'account'

class AccountRepository
  def all
    sql = 'SELECT * FROM accounts;'
    results = DatabaseConnection.exec_params(sql, [])

    all_accounts = []

    results.each { |record| 
    account = Account.new
    account.id = record['id']
    account.email = record['email']
    account.username = record['username']
    all_accounts << account
    }
    all_accounts

  end
  
  def find(id)

    sql = 'SELECT * FROM accounts WHERE id = $1;'
    sql_params = [id]
    record = DatabaseConnection.exec_params(sql,sql_params)[0]

    account = Account.new
    account.id = record['id']
    account.email = record['email']
    account.username = record['username']

    account
  end
  
  def create(account)

    sql = 'INSERT INTO accounts (email,username) VALUES ($1, $2);'
    sql_params = [account.email, account.username]
    DatabaseConnection.exec_params(sql, sql_params)

  end

  def delete(id)

    sql = 'DELETE FROM accounts WHERE id = $1;'
    sql_params = [id]
    DatabaseConnection.exec_params(sql,sql_params)

  end

  def update(account)
    
    sql = 'UPDATE accounts SET email = $1, username = $2 WHERE id = $3;'
    sql_params = [account.email, account.username, account.id]
    DatabaseConnection.exec_params(sql, sql_params)
  
  end

end