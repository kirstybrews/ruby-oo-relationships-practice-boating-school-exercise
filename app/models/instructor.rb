class Instructor

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def boating_tests
        BoatingTest.all.select do | boating_test |
            boating_test.instructor == self
        end
    end

    def passed_students
        passed_tests = self.boating_tests.select do | boating_test |
            boating_test.status == "passed"
        end
        passed_tests.map{| test | test.student} 
    end

    def change_test_status(student, test_name, status)
        boating_test_instance = nil
        self.boating_tests.each do | boating_test |
            #binding.pry
            if boating_test.student == student && boating_test.test_name == test_name
                boating_test.status = status
                boating_test_instance = boating_test
            elsif boating_test.student == student && !(boating_test.test_name == test_name)
                boating_test_instance = BoatingTest.new(student, test_name, status, self)
            end
        end
        boating_test_instance
    end

    def pass_student(student, test_name)
        self.change_test_status(student, test_name, "passed")
    end

    def fail_student(student, test_name)
        self.change_test_status(student, test_name, "failed")
    end

    def all_students
        self.boating_tests.map do | boating_test |
            boating_test.student
        end
    end

end
