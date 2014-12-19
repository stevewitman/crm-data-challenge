require_relative("../data/crm.rb")
require 'pp'

result = []
unemployed_person = {}
CRM[:people].each do |person|
  if person[:employments] == []
    unemployed_person = {
      :id => person[:id],
      :first_name => person[:first_name],
      :last_name => person[:last_name]
    }
    result << unemployed_person
  end
end
pp result
