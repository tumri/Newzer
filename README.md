# Newzer
-----

A personal project to try out CKEditor and create a basic user generated news article site.

-----

TODO:

Each user/author will have a profile where they can highlight their credentials and advertise their social media profiles. This information will also be shown in minified form on the user/author's articles.

-----

Done:

The login/logout/validation system is reused from RailsTutorial but could be replaced by Devise or similar.

User/author avatars are handled through Gravatar but may be replaced with a private avatar system in the future.

Each user/author has the ability to post fully formatted articles using CKEditor.

Images/attachments from articles are stored in Amazon S3. File storage is handled by CarrierWave and Fog because Paperclip+AWS-SDK were buggy when used with CKEditor.

An admin/editor-in-chief is able to approve articles to be shown on the featured article feed.

Each article is tagged under a category. Users are able to go to a category page, select a category, and view articles from that category.
