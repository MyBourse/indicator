# Ta-Lib function mapping class 
# Function: 'MACD'
# Description: 'Moving Average Convergence/Divergence'
# This file has been autogenerated - Do Not Edit.
class Indicator::AutoGen::Macd < Indicator::Base
  # Fast Period <Integer>
  attr_accessor :fast_period
  # Slow Period <Integer>
  attr_accessor :slow_period
  # Signal Period <Integer>
  attr_accessor :signal_period

  def initialize(*args)
    if args.first.is_a? Hash
      h = args.first
      @fast_period = h[:fast_period] || 12
      @slow_period = h[:slow_period] || 26
      @signal_period = h[:signal_period] || 9
    else
      @fast_period = args[0] || 12 
      @slow_period = args[1] || 26 
      @signal_period = args[2] || 9 
    end
    
    @func = TaLib::Function.new("MACD")
  end

  # Is price data required as an input
  def self.price_input?
    false
  end

  # The list of arguments
  def self.arguments
    [ :fast_period, :slow_period, :signal_period ]
  end

  # The minimum set of inputs required
  def self.inputs
    [ :in_real ]
  end

  # The outputs generated by this function
  def self.outputs
    [ :out_macd, :out_macd_signal, :out_macd_hist ]
  end

  def run(in_real)
    len = in_real.length
    @func.in_real(0, map(in_real))

    @func.opt_int(0, @fast_period)
    @func.opt_int(1, @slow_period)
    @func.opt_int(2, @signal_period)

    out_macd = Array.new(len)
    @func.out_real(0, out_macd)
    out_macd_signal = Array.new(len)
    @func.out_real(1, out_macd_signal)
    out_macd_hist = Array.new(len)
    @func.out_real(2, out_macd_hist)
  
    @func.call(0, len - 1)

  {:out_macd => out_macd,
    :out_macd_signal => out_macd_signal,
    :out_macd_hist => out_macd_hist}
  end
end
