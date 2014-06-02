class Person
  def initialize(**kwargs)
    kwargs.each_pair do |method, value|
      create_accessors(method, value)
    end
  end

  private

  def create_accessors(method, value)
    self.class.instance_eval do
      define_method "#{method}=" do |value|
        instance_variable_set("@#{method}", value)
      end
      define_method method do
        instance_variable_get("@#{method}")
      end
    end
    public_send("#{method}=", value)
  end
end
