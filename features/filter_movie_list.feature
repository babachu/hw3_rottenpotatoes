Feature: display list of movies filtered by MPAA rating
 
  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

Background: movies have been added to database

  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  And  I am on the RottenPotatoes home page
  
Scenario: restrict to movies with 'PG' or 'R' ratings
  When I am on the RottenPotatoes home page
  When I check "ratings_PG"  
  When I check "ratings_R" 
  When I uncheck "ratings_PG-13"  
  When I uncheck "ratings_G" 
  When I press "ratings_submit"
  Then I should see "The Incredibles"
  Then I should see "Amelie"
  Then I should not see "Chicken Run"
  Then I should not see "The Help"

Scenario: no ratings selected
  When I am on the RottenPotatoes home page
  When I uncheck "ratings_PG"  
  When I uncheck "ratings_R" 
  When I uncheck "ratings_PG-13"  
  When I uncheck "ratings_G" 
  Then I should not see "The Incredibles"
  Then I should not see "Amelie"
  Then I should not see "Chicken Run"
  Then I should not see "The Help"

Scenario: all ratings selected
  # see assignment
