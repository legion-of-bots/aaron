class Fixnum

  def to other
    (self..other)
  end

  def second
    self
  end

  def minute
    second * 60
  end

  def hour
    minute * 60
  end

  def day
    hour * 24
  end

  def week
    day * 7
  end

  def method_missing m, *args, &block
    if /(.+)s$/.match(m.to_s) and self.respond_to?($1) # support for seconds, minutes etc
      self.send($1)
    else
      super
    end
  end

end
