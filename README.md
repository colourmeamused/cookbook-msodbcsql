msodbcsql cookbook
====================================

This cookbook performs a textbook install of the [Microsoft ODBC Driver 13 (Preview) for SQL Server on Linux](https://msdn.microsoft.com/en-us/library/hh568454(v=sql.110).aspx#Anchor_0) under RHEL 7.x.

Requirements
============
- Tested to work with Chef 12.7.x or higher
- Requires a system with a valid and active Red Hat Subscription and access to Red Hat repositories from redhat.com or via Satellite / Katello.



Usage
=====
Place a dependency on the `msodbcsql` cookbook in your
cookbook's metadata.rb:

```ruby
depends 'msodbcsql', '~> 0.1.0'
```

Or include the default recipe in your run list as ``'recipe[msodbcsql]'``.


This cookbook depends on the [Red Hat Subscription Manager cookbook](https://supermarket.chef.io/cookbooks/redhat_subscription_manager).

Attributes
==========

These attributes can be used to customize the msodbcsql install.

* `node['msodbcsql']['base_url']` - Location of the driver file   
* `node['msodbcsql']['version']`  - Driver version to install, uses `13.0.0.0` by default.


Integration tests are written in Serverspec.

Contributing
============

1. Fork it ( https://github.com/colourmeamused/msodbcsql-cookbook )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
