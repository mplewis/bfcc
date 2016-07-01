# [Brandfolder Code Challenge](https://github.com/brandfolder/code-challenge)

## Matt Lewis

# Preferred Tech Stack

- [x] Ruby-on-Rails
- [ ] Javascript / React
- [x] PostgresSQL
- [ ] ElasticSearch
- [ ] Redis
- [ ] JSONAPI
- [ ] Go-lang

# User Stories

- [x] As a user I would like to create an account so that I can create and manage my polls.
- [ ] As a user I would like to create a poll so that I can share it and collect feedback.
- [ ] As a user I would like a way to share my polls on a variety of social networks so that I can gather my results.
- [x] As a user I would like to be notified whenever someone answers my poll.
- [x] As a user I would like to prevent multiple people from taking the same poll twice without requiring them to login.
- [x] As a user I would like to display the results of my post in a graphical manner so that I can visually understand the various poll answers.
- [ ] As a user I would like to set an end time to my poll and prevent any additional responses when that date is met.

# Notes

## Known Tech Debt

* `_poll_result.html.slim` is a horrific amalgamation of Ruby, JS, and external JS. This should be refactored.
* Access control is primitive: Users should be only able to access their own polls, but users can definitely delete other users and answers.
* I don't know how flashed messages are getting into the view.

## User Story Issues

> As a user I would like to prevent multiple people from taking the same poll twice without requiring them to login.

This constraint is probably impossible.

Allowing users to take polls without logging in (anonymously) relies on them not lying to the server. You can attempt to allow anonymous double votes while allowing anonymous votes with the following methods:

* **Cookies:** Set a client-side cookie when someone votes. If the cookie is present, don't let them vote again. Bad actors can delete the cookie.
* **IP Address:** Allow one vote per poll per IP. This keeps multiple people at the same IP from both voting (i.e. users at school, roommates on the same router).
* **Tie Anon Votes to Account:** Anonymous votes aren't counted until the user creates an account logs in. This might be useful if market research says users are turned off by having to log in, but they still have to create an account to vote.

Right now, one user can cast one vote per poll and only logged-in users can vote. I would only consider building in this constraint if I understood the purpose better.
