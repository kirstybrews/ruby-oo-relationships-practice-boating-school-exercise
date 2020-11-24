class Student

    attr_reader :first_name

    @@all = []

    def initialize(first_name)
        @first_name = first_name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(test_name, status, instructor)
        BoatingTest.new(self, test_name, status, instructor)
    end

    def instructors
        boating_tests = BoatingTest.all.select do | boating_test |
            boating_test.student == self
        end
        instructors = boating_tests.map do | boating_test |
            boating_test.instructor
        end
        instructors.uniq
    end

    def self.find_student(first_name)
        self.all.find do | student |
            student.first_name == first_name
        end
    end

    def grade_percentage
        boating_tests = BoatingTest.all.select do | boating_test |
            boating_test.student == self
        end
        passed_tests = boating_tests.count do | boating_test |
            boating_test.status == "passed"
        end
        passed_tests.to_f / boating_tests.length.to_f
    end

end
