**Newzer**
-----

***A personal project to create a user generated news article application using Ruby on Rails.***

------

***TODO:***

* Implement better [:flash] messages by attaching them below the static navbar instead of having them appear at the top of the page.

* Improve the contact, help, and about pages. Replace placeholder images with relevant images in the categories page.

* Testing is currently underwhelming. Tests must be created for article and comment create/edit/delete. Tests must also be created for file uploads/deletions with S3. User tests must be expanded to include moderators.

-----

***Done:***


* The login/logout/validation system is a basic implementation but could be replaced by Devise or similar. Users are divided into admins, mods, and basic users. Admins have all power user privileges, mods have all power user privileges but cannot delete other users, and basic users only have basic privileges.

* Each user has a profile where their previous articles and comments are be displayed.

* Registered and logged in users have a separate dashboard-like "Home" page.

* Admins can promote users to mods or demote mods to users through the user profile page.

* User avatars are handled through Gravatar but may be replaced with a private avatar system in the future.

* Each user has the ability to post fully formatted articles using CKEditor. Images/attachments may be direct linked from an outside host such as Imgur or uploaded directly to internal file storage from the CKEditor article form page.

* Images/attachments are stored in Amazon S3. File storage is handled by CarrierWave and Fog. Each user's uploads are private and are not available to outside users. If a user is deleted then their attachments/images are deleted from S3 as well.

* Admins/Mods are able to approve articles to be shown on the approved page. An admin/mod is able to feature articles to appear on the featured page. Featured articles that are not also approved do not appear in the featured page. Essentially an article's visibility outside the "Feed" page is determined by it's approval status.* Admins/Mods are able to delete articles, and comments. They are also able to silently edit an article without altering the user the article is associated with.

* Each article is tagged under a category. Users are able to go to a category page, select a category, and view articles from that category.

* Users are able to leave comments on articles. Comments may also be replied to in a nested hierarchical fashion(implemented using closure_tree). If a root comment is deleted then the replies to that root comment become root comments themselves. A context button is provided so that each comment's parent comment or parent article may be easily found.

* Comment replies use AJAX to allow users to reply to comments without a redirect or reload.

* Articles are be able to be reported for inappropriate content before they are approved. Admins/Mods are then see these reported articles in a sepearate reported article feed. Comments are also be able to be reported for inappropriate content and put into a separate reported comment feed for Admins/Mods.

* Optimized for Turbolinks compatibility.

-----

***Future Plans(2.0):***

* The frontend should be reimplemented using Ember to cut down on page loads and provide a better UX. Alternatively, waiting for Turbolinks 3 and ActionCable may end up being a better option over redoing everything.

* A voting system should be implemented so that "Featured" articles are automatically flagged as such after reaching a certain popularity threshold.

* An automated temporary moderation system should be implemented so that heavily reported/flagged articles/comments are automatically toggled "hidden" until an Admin/Mod is able to manually inspect the offending material.

* A bookmarking and favoriting system should be implemented with notification options for users to be alerted when their favorited writers post a new article or when an older article is updated.

* A user reengagement system should be implemented using points or intangible rewards such as badges to encourage users to repeatedly visit and engage in the site's content without any sort of email notification spam prodding them to do so.

* Writers with a certain popularity threshold should be given a small discussion board of sorts for their fans to mingle and discuss topics that the writer focuses on. Suggestions for future articles could also be posted and voted on in this discussion board.
