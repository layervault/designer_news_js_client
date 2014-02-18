# Designer News API

NodeJS client for accessing the [Designer News API](https://developers.news.layervault.com).

## Installation

The library is available on npm:

```
npm install designer-news
```

## Configuration

``` js
var DN = require('designer-news');

// Configure
var config = new DN.Configuration(function () {
  this.oauthKey = 'abc123'
  this.oauthSecret = 'foobar'

  // optional, if you have it
  this.accessToken = 'jfosdf9sud98fds0f8snd0fs8dnf'
});

// Create the client
var client = new DN.Client(config);
```

## Usage

### Authentication

``` js
// If configured without an access token, you will need
// to authenticate and retrieve one. Here's the password flow:
client.auth.withPassword('username', 'password', function (err, tokens) {
  // We are now logged in. The configuration is automatically updated
  // with the access token. We can store them somewhere persistent
  // if needed.
});
```

### Retrieving Data

The JS function names roughly follow the same convention as the API URLs.

``` js
client.me(callback);

client.stories.get(id, callback);
client.stories.frontPage({page: 2}, callback);
client.stories.recent({page: 2}, callback);
client.stories.search(query, callback);
client.stories.upvote(id, callback);
client.stories.reply(id, comment, callback);

client.comments.get(id, callback);
client.comments.upvote(id, callback);
client.comments.reply(id, comment, callback);

client.motd.get(callback);
client.motd.upvote(callback);
client.motd.downvote(callback);
```

### Promises

All asynchronous calls return a promise, which can be used as an alternative to providing a callback.

``` js
client.auth.withPassword('username', 'password').then(function (resp) {
  console.log(resp.accessToken);
  return client.stories.frontPage();
}).then(function (resp) {
  return client.stories.upvote(resp.stories[0].id);
}).then(function (story) {
  console.log(story);
});
```

## Links

* [API Documentation](http://developers.news.layervault.com)

## Author

Ryan LeFevre - [GitHub](https://github.com/meltingice), [Twitter](https://twitter.com/meltingice), [Email](mailto:ryan@layervault.com)

## License

Available under the MIT license. See the LICENSE file for more info.
