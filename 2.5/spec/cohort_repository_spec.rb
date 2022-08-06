# require "cohort_repository"

# def reset_students_table
#   seed_sql = File.read('spec/seeds.sql')
#   connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2_test' })
#   connection.exec(seed_sql)
# end

# RSpec.describe CohortRepository do 

#   before(:each) do 
#     reset_students_table
#   end

#   it "finds a cohort with students" do
    
#     repo = CohortRepository.new 

#     cohort = repo.find_with_students(1)

#     expect(cohort.name).to eq("January")
#     expect(cohort.students[0].name).to eq("John")
#     expect(cohort.students[1].name).to eq("Stephen")
#     expect(cohort.students[2].name).to eq("Alice")

#   end


# end