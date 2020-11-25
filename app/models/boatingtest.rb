class BoatingTest

    attr_accessor :status
    attr_reader :student, :instructor, :test_name

    @@all = []

    def initialize(student, test_name, status, instructor)
        @student = student
        @test_name = test_name
        @status = status
        @instructor = instructor
        self.class.all << self
    end

    def self.all
        @@all
    end

end
