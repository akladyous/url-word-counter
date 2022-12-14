# URL Word Counter

## Instructions

For this project, we’ll be building out a basic Rails application to output the
top 25 words on a given URL, with the number of times that word is on the page.

## Tips

We could leverage open source projects to help achieve better results. therefore
we do not need to recreate libraries that already exist.

## External Gems

-   FriendlyId [link](https://rubygems.org/gems/words_counted/versions/1.0.2)
-   Words Counted [link](https://rubygems.org/gems/friendly_id)

## Setup

To get started, run the following while inside of this directory.

1. Run `bundle install` in your terminal.
2. Run `bin/rails db:create` This will create the database in Postgres Server.
3. Run `bin/rails db:migrate` To apply changes for all migrations that have not
   yet been run.
4. Run `bin/rails db:seed` to generate some fake data to work with.
5. Run `bin/rails s` to start the server.

## What You Already Have

The starter code has migrations and models for the initial `Posts` and
`FriendlyId` models, and seed data for `Posts`'s model. The schema currently
looks like this:

### `posts` table

| Column | Type   |
| ------ | ------ |
| title  | String |
| slug   | String |
| body   | Text   |

## Deliverables

-   Generate Restful Route with a specific Actions to generate basic statistics
    for a given URL.

-   Create, Model to perform 2 main taks

    -   Tokenization
    -   Analysis & Statistics

## Bonus

-   Form Validation Errors Helper
-   Flash messages Helper
-   Css Styling with Bootstrap

## Comment

For the sake of this project I have integrated `FriendlyId` gem, just to have
some friendly generated url to work with.

## Demo

![intro](https://user-images.githubusercontent.com/73612260/192164386-e6d7e7b2-51cf-4ad3-8bb2-d1b373855e2c.gif)
