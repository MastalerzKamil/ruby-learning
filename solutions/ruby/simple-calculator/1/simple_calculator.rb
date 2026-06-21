class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError; end

  def self.calculate(first_operand, second_operand, operation)
    begin
      # Validate operation is a string and not nil or empty
      if operation.nil? || operation == ""
        raise UnsupportedOperation.new("Invalid operation")
      end

      if !operation.is_a?(String)
        raise UnsupportedOperation.new("Invalid operation")
      end

      # Validate operation is in allowed list
      if !ALLOWED_OPERATIONS.include?(operation)
        raise UnsupportedOperation.new("Invalid operation")
      end

      # Validate operands are NOT strings (must be numeric types)
      if first_operand.is_a?(String) || second_operand.is_a?(String)
        raise ArgumentError.new("Invalid argument")
      end

      # Validate operands are not nil
      if first_operand.nil? || second_operand.nil?
        raise ArgumentError.new("Invalid argument")
      end

      # Check for division by zero
      if operation == '/' && second_operand == 0
        raise ZeroDivisionError.new("Division by zero is not allowed.")
      end

      result = case operation
               when '+' then first_operand + second_operand
               when '*' then first_operand * second_operand
               when '/' then first_operand / second_operand
               end

      "#{first_operand} #{operation} #{second_operand} = #{result}"
    rescue UnsupportedOperation
      raise
    rescue ArgumentError
      raise
    rescue ZeroDivisionError
      "Division by zero is not allowed."
    end
  end
end