require "singleton"

module TryCorder
  class Recorder
    include Singleton

    def self.count(klass, unparsed_source_string)
      TryCorder.instance.count(klass, unparsed_source_string)
    end

    def count(klass, unparsed_source_string)
      parsed_source_string = unparsed_source_string.split("in")
      split_source_string = parsed_source_string[0].split("/app/")[1]

      unless split_source_string.nil?
        counter[klass] = {} unless counter[klass]

        local_source_file = "app/" + split_source_string
        counter[klass][local_source_file] = counter[klass][local_source_file].to_i.succ
      end
    end

    def counter
      @_counter ||= {}
    end
  end
end
