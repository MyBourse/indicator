# Ta-Lib function mapping class 
# Function: 'MINMAX'
# Description: 'Lowest and highest values over a specified period'
# This file has been autogenerated - Do Not Edit.
class Indicator::AutoGen::MinMax < Indicator::Base
  # Time Period <Integer>
  attr_accessor :time_period

  def initialize(*args)
    if args.first.is_a? Hash
      h = args.first
      @time_period = h[:time_period] || 30
    else
      @time_period = args[0] || 30 
    end
    
    @func = TaLib::Function.new("MINMAX")
  end

  # Is price data required as an input
  def self.price_input?
    false
  end

  # The list of arguments
  def self.arguments
    [ :time_period ]
  end

  # The minimum set of inputs required
  def self.inputs
    [ :in_real ]
  end

  # The outputs generated by this function
  def self.outputs
    [ :out_min, :out_max ]
  end

  def run(in_real)
    len = in_real.length
    @func.in_real(0, map(in_real))

    @func.opt_int(0, @time_period)

    out_min = Array.new(len)
    @func.out_real(0, out_min)
    out_max = Array.new(len)
    @func.out_real(1, out_max)
  
    @func.call(0, len - 1)

  {:out_min => out_min,
    :out_max => out_max}
  end
end
