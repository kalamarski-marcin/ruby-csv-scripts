# coding: utf-8

require 'csv'

unless ARGV.empty?
  hs = %w(name lastname)
  CSV.open('list_c.csv', 'w') do |csv|
    csv << hs
    ARGV.each do |file|
      CSV.foreach(file, headers: true) { |row| csv << row.fields(*hs) }
    end
  end
end
