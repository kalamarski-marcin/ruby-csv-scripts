# :nodoc
class Person
  attr_accessor :name, :lastname

  def initialize(name:, lastname:)
    self.name = name
    self.lastname = lastname
  end

  def to_s
    "#{name} #{lastname}"
  end

  def self.load_list(raw_persons)
    raw_persons.map do |raw_person|
      Person.new(raw_person)
    end
  end
end
