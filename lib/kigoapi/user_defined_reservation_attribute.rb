module KigoAPI
    class UserDefinedReservationAttribute
        attr_reader :type 

        attr_accessor :id
        attr_accessor :name
        attr_accessor :text
        attr_accessor :choice_id
        attr_accessor :choices

        def initialize(udra)
            self.type = udra["UDRA_TYPE"].to_sym
            self.id = udra["UDRA_ID"]
            self.name = udra["UDRA_NAME"]

            self.text = ""
            self.choices = []
        end

        def type=(type)
            if [:SINGLE_LINE_TEXT, :MULTI_LINE_TEXT, :SINGLE_CHOICE, :MULTI_UNORDERED_CHOICE].include?(type)
                @type = type
            else
                raise ArgumentError, "Invalid type (Available :SINGLE_LINE_TEXT, :MULTI_LINE_TEXT, :SINGLE_CHOICE, :MULTI_UNORDERED_CHOICE)"
            end
        end

        def dispatch_method
            method = nil

            if [:SINGLE_LINE_TEXT, :MULTI_LINE_TEXT].include? self.type
                method = :text
            elsif self.type == :SINGLE_CHOICE
                method = :choice_id
            elsif self.type == :MULTI_UNORDERED_CHOICE
                method = :choices
            else
                raise "Incorrent type"
            end

        end

        def value=(val)
            method = self.dispatch_method

            self.send("#{method}=".to_sym, val)
        end

        def value
            return self.send(self.dispatch_method)
        end

        def to_sym 
            self.name.downcase.to_sym 
        end

        def as_json(options=nil)
            obj = {
                :UDRA_ID => @id
            }

            if @type == :SINGLE_LINE_TEXT || @type == :MULTI_LINE_TEXT
                obj[:UDRA_TEXT] = @text 
            elsif @type == :SINGLE_CHOICE
                obj[:UDRA_CHOICE_ID] = @choice_id
            elsif @type == :MULTI_UNORDERED_CHOICE
                obj[:UDRA_CHOICES] = @choices
            end

            obj
        end
    end
end