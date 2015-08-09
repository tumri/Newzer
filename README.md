# Newzer
-----

A personal project to try out CKEditor and create a basic user generated news article site.

-----

TODO:

Comment replies to other comments currently require a redirect. An AJAX rendering of the comment form would be beneficial.

Each user/author will have a profile where they can highlight their credentials and advertise their social media profiles. This information will also be shown in minified form on the user/author's articles.

-----

Done:

The login/logout/validation system is a basic implementation but could be replaced by Devise or similar.

User avatars are handled through Gravatar but may be replaced with a private avatar system in the future.

Each user has the ability to post fully formatted articles using CKEditor. Images/attachments may be direct linked from an outside host such as Imgur or uploaded directly to internal file storage from the CKEditor article form page.

Images/attachments are stored in Amazon S3. File storage is handled by CarrierWave and Fog. Each user's uploads are private and are not available to outside users. If a user is deleted then their attachments/images are deleted from S3 as well.

Admins are able to approve articles to be shown on the approved page. An admin is able to feature articles to appear on the featured page. Featured articles that are not also approved do not appear in the featured page. Essentially an article's visibility outside the "Feed" page is determined by it's approval status.

Admins are able to delete users, articles, and comments. They are also able to silently edit an article without altering the user the article is associated with.

Each article is tagged under a category. Users are able to go to a category page, select a category, and view articles from that category.

Users are able to leave comments on articles. Comments may also be replied to in a nested hierarchical fashion(implemented using closure_tree). If a root comment is deleted then the replies to that root comment become root comments themselves. A context button is provided so that each comment's parent comment or parent article may be easily found.
