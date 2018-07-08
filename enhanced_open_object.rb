class EnhancedOpenObject
  def initialize(attributes = {}, hack_for_activeresource = false)
    @inner_object = attributes
  end

  def method_missing(method, *args, &block)
    method = method.to_s
    if @inner_object.key?(method)
      @inner_object[method]
    else
      super(method)
    end
  end

  def respond_to?(method, include_private = false)
    super || @inner_object.key?(method)
  end

  def as_json(options=nil)
    @inner_object.send(:table).as_json(options)
  end

  def ==(other)
    @inner_object == other.instance_variable_get(:@inner_object)
  end

  def eql?(other)
    @inner_object.eql?(other.instance_variable_get(:@inner_object))
  end

  def equal?(other)
    @inner_object.equal?(other.instance_variable_get(:@inner_object))
  end

  def hash
    @inner_object.hash
  end
end

