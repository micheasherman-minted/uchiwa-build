default['uchiwa-build']['workdir'] = '/tmp/build'
default['uchiwa-build']['golang'] = 'https://storage.googleapis.com/golang/go1.3.3.linux-amd64.tar.gz'
default['uchiwa-build']['git'] = 'github.com/sensu/uchiwa'

default['uchiwa-build']['uchiwa_version'] = '0.0.1'
default['uchiwa-build']['build_number'] = '1'

default['uchiwa-build']['s3_bucket'] = 's3_apt_repo'
default['uchiwa-build']['s3_gpg_sign'] = false
default['uchiwa-build']['s3_amazon_access_key_id'] = ''
default['uchiwa-build']['s3_amazon_secret_access_key'] = ''
default['uchiwa-build']['s3_debian_codename'] = 'precise'
