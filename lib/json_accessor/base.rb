module JSONAccessor
  def json_accessor(column, *attrs)
    accessor_name = attrs.dup.unshift(column).join('_')

    define_method accessor_name do
      public_send(column).dig(*attrs.map(&:to_s))
    end

    define_method "#{accessor_name}=" do |value|
      hash = attrs.reverse.inject(value) { |a, n| { n.to_s => a } }
      public_send(column).merge!(hash)
    end
  end
end
