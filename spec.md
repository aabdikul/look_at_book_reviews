# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - AA: I used the Sinatra DSL and all of its pre-written methods to build an MVC application.  
- [x] Use ActiveRecord for storing information in a database - AA: I used the ActiveRecord gem to enhance my application. It let me create rack-based migrations, build tables, and use built-in methods. 
- [x] Include more than one model class (e.g. User, Post, Category) - AA: I have three models: Book, Review, User.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - AA: I have several has_many, belongs_to, and has_many, through:, relationships.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - AA: See above.
- [x] Include user accounts with unique login attribute (username or email) - AA: My reviewers have unique logins that are authenticated using has_secure_password.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - AA: All users can add new books but only the creator of a review can edit or delete it. 
- [x] Ensure that users can't modify content created by other users - AA: Only creators can edit or delete their own reviews.
- [x] Include user input validations - AA: A user can't create a blank review.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - AA: If a user attempts to input a blank review, they are given a flash message using rack-flash. 
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - AA: My README.md has a description.

Confirm
- [x] You have a large number of small Git commits - AA: I committed often but need to continue to do so.
- [x] Your commit messages are meaningful - AA: I left my commits notes on what was changed.
- [x] You made the changes in a commit that relate to the commit message - AA: My commit notes made sense.
- [x] You don't include changes in a commit that aren't related to the commit message - AA: I don't have changes that aren't encompassed in my commit messages. 