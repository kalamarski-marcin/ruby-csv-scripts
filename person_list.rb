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

puts case ARGV.first
     when '--sort-by-name-last_name'
       persons_list.sort_by { |person| [person.name, person.lastname] }
     when '--sort-by-last_name-name'
       persons_list.sort_by { |person| [person.lastname, person.name] }
     else
       persons_list
     end
