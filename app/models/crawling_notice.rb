class CrawlingNotice < ApplicationRecord
        validates_uniqueness_of :url
end
