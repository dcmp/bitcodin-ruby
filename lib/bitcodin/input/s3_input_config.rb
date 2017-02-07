module Bitcodin
  class S3InputConfig

    attr_accessor :values

    def initialize(accessKey, secretKey, bucket, region, objectKey)
      @values = '{
  "type": "s3",
  "accessKey": "' + accessKey + '",
  "secretKey": "' + secretKey + '",
  "bucket": "' + bucket + '",
  "region": "' + region + '",
  "objectKey": "' + objectKey + '"
}'
    end
  end
end
