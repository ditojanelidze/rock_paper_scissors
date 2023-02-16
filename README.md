## Requiments:
- Ruby 3.1.2
- Rails 7.0.4

### About Project
```
Project is API for rock-paper-scissor game.
By default, project supports only 3 choice(rock, paper, scissor), but
database structure lets us easily add new choices with appropriate rules.
We need to create new record in 'choices' table and appropriate records in 'game_rules' table.
```
### How To Set Up
```
git clone https://github.com/ditojanelidze/exadel-test
cd exadel-test
bundle install

create files 'env.development.local' and 'env.test.local' in the top level ofthe project.
Copy template 'DATABASE_URL' parameter and fill it with local postgresql database user credentials.

rails db:create RAILS_ENV=development
rails db:create RAILS_ENV=test
rails db:seed
```
### Testing
```
Project comes with Swagger,
visit 'localhost:300/api-docs' to see swagger docs/.

There is two endpoint.
One for listing all choices and another for playing the game.
To test correctness of the functionality, call POST /play request and
see what was chosen by computer and what was the result of the game.
```


