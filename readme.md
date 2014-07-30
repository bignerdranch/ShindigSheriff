#Shindig Sheriff
Application for managing events.

##Minimum Viable Product
For use by organizers and financial approvers. Organizers can add,  remove, and edit organizations and events. Organizers can add and remove expenses to events. Finance approver can confirm that incomes have been received, and can approve or reject organizer expenses.

The organizer home dashboard lists organizations. The organization dashboard lists events.

##Development

### Wiki
[Project Wiki](https://github.com/bignerdranch/ShindigSheriff/wiki)

### Requirements

* Ruby 2.1.0
* [Postgresql](http://www.postgresql.org)


### Setup

Fork the repo:

*  Visit the [ShindigSherrif](https://github.com/bignerdranch/ShindigSheriff) github page.
*  Fork the repo. In the upper right corner of the page, click the `Fork` button.

Clone your forked repo locally:

*  Go to `https://github.com/YOUR_GITHUB_USERNAME_HERE/ShindigSheriff`
*  Clone the repo:

```
$ git clone https://github.com/YOUR_GITHUB_USERNAME_HERE/ShindigSheriff.git
$ cd ShindigSheriff
```

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
