require_relative("../data/crm.rb")
require 'pp'
result = []
person_hash = {}
CRM[:people].each do |person|
  if person[:employments] != []
    person[:employments].each do |employment|
      person_hash ={
        :company_id => employment[:company_id],
        :company_name => CRM[:companies].select { |company| company[:id] == employment[:company_id] },
        :person_id => person[:id],
        :person_first_name => person[:first_name],
        :person_last_name => person[:last_name],
        :title => employment[:title]
      }
      result << person_hash
    end
  end
end
pp result
