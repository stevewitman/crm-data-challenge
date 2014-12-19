require_relative("../data/crm.rb")
require 'pp'

## Challenge #1 - employees of companies
# Write some code that will return an array of companies,
# and the people who work for them.  For example:

result = []
company_hash = {}
CRM[:companies].each do |company|
  company_hash = {:name => company[:name], :employees => []}
  CRM[:people].each do |person|
    if person[:employments] != []
      person[:employments].each do |employment|
        if employment[:company_id] == company[:id]
          employee_hash = {}
          employee_hash[:id] = person[:id]
          employee_hash[:first_name] = person[:first_name]
          employee_hash[:last_name] = person[:last_name]
          employee_hash[:title] = employment[:title]
          company_hash[:employees] << employee_hash
        end
      end
    end
  end
  result << company_hash
end

pp result
