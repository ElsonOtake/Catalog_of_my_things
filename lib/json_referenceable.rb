module JsonReferenceable
  def to_json(*)
    { JSON.create_id => self.class.name, 'a' => json_fields }.to_json(*)
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def json_create(object)
      new(*object['a'])
    end
  end
end
