#Shindig Sheriff
Application for managing events.

##Minimum Viable Product
For use by organizers and financial approvers. Organizers can add,  remove, and edit organizations and events. Organizers can add and remove expenses to events. Finance approver can confirm that incomes have been received, and can approve or reject organizer expenses.

The organizer home dashboard lists organizations. The organization dashboard lists events.

##Development

### Requirements

* Ruby 2.1.0
* [Postgresql](http://www.postgresql.org)


### Setup

Clone the repository locally

    $ git clone https://github.com/bignerdranch/ShindigSheriff.git
    $ cd ShindigSheriff

Creating a gemset with .rvmrc is recommended.

    $ echo 'rvm --create use 2.1.0@shindigsheriff' > .rvmrc

Download gems

    $ bundle install

Load database

    $ rake db:setup

Start the rails server

    $ rails s

Open the application in your favorite browser

    localhost:3000


###Testing

Prepare test database

    $ rake db:test:prepare

Run the full test suite:

    $ rspec spec
