# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.woomatch.com"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.public_path = 'public/'

SitemapGenerator::Sitemap.create do
  
  
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't sitemapspecify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  
    add '/info/about'
  
    Activity.find_each do |activity|
       add '/info/my_activity/'+activity.slug, :lastmod => activity.updated_at
    end
end
