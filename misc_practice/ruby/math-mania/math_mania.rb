module MathMania
  #one class per file
  class EmptyNameError < StandardError
  end

  class UI
    # all IO puts and gets
  end

  class Game
    attr_reader :question, :response

    def initialize
      @question = ""
      @response = 0
    end

    # I/O: class instance, class instance / string
    # Displays a welcome message as a string.
    def display_welcome(player1, player2)
      puts "Welcome to Math Mania, #{player1.name} and #{player2.name}!\n"
      puts "You will be competing against your friend for the highest score."
      puts "Type your best guess. All division questions are rounded to the "
      puts "nearest whole number.\n"
      puts "Type QUIT to exit."
    end

    # I/O:  class instance / string
    # Asks for the user's input after providing a question
    def display_question(player)
      puts "#{player.name}'s turn:"
      print "Evaluate the following expression: "
      puts create_question
      get_response
      puts "The answer was #{validate_response(player)}."
    end

    # I/O:  none / string
    # Checks that the user's input is valid.
    def get_response
      while true
        @response = gets.chomp
        exit if @response.upcase == "QUIT"
        begin
          Integer(@response)
          break
        rescue ArgumentError => e
          puts "Please enter a valid integer:"
        end
      end
    end

    # I/O: class instance / string
    # Checks whether the response was corresct or not.
    def validate_response(player)
      if response_equal_answer?
        player.score += 1
        return "correct"
      else
        player.lives -= 1
        return "incorrect"
      end
    end

    # I/O: class instance, class instance / string
    # Checks whether the response was corresct or not.
    def final_score(player1, player2)
      puts "======FINAL SCORE======"
      if player1.score > player2.score
        puts "#{player1.name} wins!"
      else
        puts "#{player2.name} wins!"
      end
      player1.display_score
      player2.display_score
    end


    private

    # I/O: none / integer
    # Generates a random number for the question.
    def operand
      rand(1..20)
    end

    # I/O: none / string
    # Pulls a random operator from an array.
    def type
      ["+","-","*"].sample
    end

    # I/O: none / string
    # Creates a question from two numbers and an operator
    def create_question
      @question = "#{operand} #{type} #{operand}"
    end

    # I/O none / boolean
    # Verifies the response against the question evaluated as a math statement
    def response_equal_answer?
      @response.to_i == eval(@question)
    end


  end

  class Player
    attr_accessor :score, :lives
    attr_reader :id_number, :name

    def initialize(id_number)
      @name = ""
      @score = 0
      @lives = 3
      @id_number = id_number
    end

    # I/O: none / string
    # Gets the player's name and makes sure it is valid.
    def get_name
      puts "Please enter player #{id_number}'s name: "
      while true
        begin
          @name = gets.chomp
          raise EmptyNameError if @name.empty?
          break
        rescue EmptyNameError
          puts "You input was blank. Please try again."
        end
      end

    end

    # I/O: none / string
    # Displays the player's score
    def display_score
      puts "-----#{@name}-----"
      puts "Score: #{@score}     "
      puts "Lives left: #{@lives}"
      puts "---------------"
    end

    # I/O: none / integer
    # Checks to see if the player has lost all lives
    def game_over?
      @lives == 0
    end
  end
end
