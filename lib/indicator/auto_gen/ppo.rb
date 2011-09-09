# Ta-Lib function mapping class 
# Function: 'PPO'
# Description: 'Percentage Price Oscillator'
# This file has been autogenerated - Do Not Edit.
class Indicator::AutoGen::Ppo < Indicator::Base
  # Fast Period <Integer>
  attr_accessor :fast_period
  # Slow Period <Integer>
  attr_accessor :slow_period
  # MA Type <MA Type>
  attr_accessor :ma_type

  def initialize(*args)
    if args.first.is_a? Hash
      h = args.first
      @fast_period = h[:fast_period] || 12
      @slow_period = h[:slow_period] || 26
      @ma_type = h[:ma_type] || 0
    else
      @fast_period = args[0] || 12 
      @slow_period = args[1] || 26 
      @ma_type = args[2] || 0 
    end
    
    @func = TaLib::Function.new("PPO")
  end

  # Is price data required as an input
  def self.price_input?
    false
  end

  # The list of arguments
  def self.arguments
    [ :fast_period, :slow_period, :ma_type ]
  end

  # The minimum set of inputs required
  def self.inputs
    [ :in_real ]
  end

  # The outputs generated by this function
  def self.outputs
    [ :out_real ]
  end

  def run(in_real)
    len = in_real.length
    @func.in_real(0, map(in_real))

    @func.opt_int(0, @fast_period)
    @func.opt_int(1, @slow_period)
    @func.opt_int(2, @ma_type)

    out_real = Array.new(len)
    @func.out_real(0, out_real)
  
    @func.call(0, len - 1)

    out_real
  end
end
