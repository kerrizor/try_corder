require "try_corder/recorder"
require "try_corder/reporter"
require "try_corder/version"

module ObjectExtension
  def try(*a, &b)
    TryCorder::Recorder.count(self.class.to_s, caller(1,1).first)

    super(*a, &b)
  end
end

class Object
  prepend ObjectExtension
end
