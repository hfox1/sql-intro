require_relative "cohort"
require_relative "student"

class CohortRepository 


  def find_with_students(id)
   
    sql = 'SELECT cohorts.id, cohorts.cohort_start_date, students.id AS "student_id", students.name AS "student_name" FROM cohorts JOIN students ON cohorts.id = 
           students.cohort_id WHERE cohorts.id = $1;'  
    sql_params = [id]

    
    results = DatabaseConnection.exec_params(sql, sql_params)
    records = results[0]

    cohort = Cohort.new 
    cohort.id = records["id"]
    cohort.cohort_start_date = records["cohort_start_date"]


    results.each { |record|
      student = Student.new
      student.id = record["student_id"] 
      student.name = record["student_name"] 
      cohort.students << student
    }


    return cohort

  end

end 