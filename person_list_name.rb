# coding: utf-8

require './person'
require 'csv'

puts Person.load_list(
  CSV.read(
    'list.csv',
    headers: true,
    header_converters: :symbol
  )
).map(&:lastname).uniq
