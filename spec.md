# Specifications for the Sinatra Assessment

## Specs:

- [x] Use Sinatra to build the app

  - Gemfile contains Sinatra.
  - Used Sinatra to create MVC framework via the Corneal gem.

- [x] Use ActiveRecord for storing information in a database

  - Gemfile contains ActiveRecord.
  - Used SQLite3 gem in development phases, Heroku branch uses PG gem for deployment to Heroku.

- [x] Include more than one model class (e.g. User, Post, Category)

  - This project has three models: Account, job, and User.

- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)

  - The User model contains the relationship `has_many :jobs`

- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)

  - The job model contains the relationship `belongs_to :User`
  - The User model contains the relationship `belongs_to :Account`

- [x] Include user accounts with unique login attribute (username or email)

  - The User model uses AR validation 
    - `validates :email, uniqueness: { case_sensitive: false }`
  - The Account model used AR validation 
    - `validates :username, presence: { message: "is required." }`
    - `validates :username, uniqueness: { case_sensitive: false, message: "is already taken, please try again." }`

- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

  - The CRUD functions for the project are all taken care of via the User model, currently updates to the Account model are not permitted.

- [x] Ensure that users can't modify content created by other users

  - A helper method aptly named `redirect_if_cannot_edit` takes care of ensuring only owners of the content can edit/delete that content.

- [x] Include user input validations

  - Account Model
    - `has_secure_password`
    - `validates :username, presence: { message: "is required." }`
    -- `validates :username, uniqueness: { case_sensitive: false, message: "is already taken, please try again." }`
  - User Model
    - `validates :email, uniqueness: { case_sensitive: false }

- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message


