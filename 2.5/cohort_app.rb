require_relative 'lib/database_connection'
require_relative 'lib/cohort_repository'
# We need to give the database name to the method .                                     
#  'student_directory_2'

class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, io, cohort_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @cohort_repository = cohort_repository
  end

  def run
    # "Runs" the terminal application
    # so it can ask the user to enter some input
    # and then decide to run the appropriate action
    # or behaviour.

    # Use `@io.puts` or `@io.gets` to
    # write output and ask for user input.

    @io.puts "Choose a cohort to see the list of students!"
    @io.puts "Enter 1 or 2:"
    input = @io.gets.chomp
    
      repo = CohortRepository.new
      cohort = repo.find_with_students(input.to_i)

      puts "#{cohort.cohort_start_date}:"

      cohort.students.each { |record|
        puts record.name
      }


  end
end

# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'student_directory2',
    Kernel,
    CohortRepository.new
  )
  app.run
end