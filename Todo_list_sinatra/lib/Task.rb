class Task
    attr_accessor :content, :id, :created_at, :updated_at, :complete, :current_id
    @@current_id = 1
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @complete = false
        @created_at = Time.now
        @updated_at = nil
    end

    def complete?
      @complete
    end

    def complete!
      @complete = true
    end

    def make_incomplete!
      @complete = false
    end

    def update_content!(input)
      @content = input
      @updated_at = Time.now
    end

    def re_set_current_id
      if @@current_id > @id.to_i
        @@current_id = @id.to_i + 1
      end
    end
end
