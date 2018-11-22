class SumOfMultiples

  def initialize(*args)
    @args = args
  end

  def to(limit)
   return 0 if @args.empty?
   ms = @args.reduce([]) {|accum, n| accum | mults(n, limit)}
   ms.sum
  end

  def mults(num, limit)
    return [num] if num == 0
    accum = []
    while (next_num = (accum[-1] || 0) + num) < limit
      accum << (next_num)
    end
    accum
  end
end


