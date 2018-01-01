module TryCorder
  class Reporter
    def self.report
      output = "\n\n" + divider

      TryCorder::Recorder.instance.counter.each do |k,v|
        try_count = 0

        output << "#{k}\n"
        output << "--------------------\n"

        v.each do |k,v|
          output << "#{k}: #{v}\n"
          try_count += v
        end

        output << "\n\nTotal uses of :try for this class: #{try_count}\n\n"
      end

      output << divider

      puts output
    end

    private

    def self.divider
      "=====================\n\n"
    end
  end
end
