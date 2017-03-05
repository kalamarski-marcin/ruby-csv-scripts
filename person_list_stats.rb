# coding: utf-8

require './person'
require 'csv'

persons_list = Person.load_list(
  CSV.read(
    'list.csv',
    headers: true,
    header_converters: :symbol
  )
)

[
  { label: '>> Lastnames:', field: :lastname },
  { label: '>> Names:', field: :name }
].each do |i|
  puts i.fetch(:label)
  persons_list
    .map(&i.fetch(:field))
    .each_with_object(Hash.new(0)) { |key, hash| hash[key] += 1 }
    .each { |k, v| puts "#{k} (#{v})" }
end
