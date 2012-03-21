# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
   m=Movie.new
   m.title = movie["title"]
   m.rating = movie["rating"] 
   m.release_date = movie["release_date"]
   m.save!
  end
end


# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  str=page.body
  e1_ind=str.index(e1)
  ed2_ind=str.index(e2)
  assert(e1<e2,"Movies not sorted")
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

Given /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  str=rating_list.split(',')
  str.each{|r1|
  r=("ratings_"+r1).gsub(/'/,'')
  if uncheck
     uncheck(r)
  else
     check(r)
  end
  }
end
# HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb

Then /I should see all of the movies/ do
numm=Movie.find(:all)
assert page.has_css?('tbody tr',:count => numm.length), "Expected #{numm.length} rows"
end
