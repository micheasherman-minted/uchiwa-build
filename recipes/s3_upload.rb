#
# Cookbook Name: uchiwa-build
# Recipe:: s3_upload
#
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

gem_package 'deb-s3' do
  options('--no-ri --no-rdoc')
  action :install
end

if node['uchiwa-build']['s3_gpg_sign']
  bash 'copy .gnupg into $HOME' do
    user 'root'
    code 'cp -Rp /tmp/build/.gnupg $HOME/'
  end
  gpg_opts = '--sign'
end

bash 's3 upload' do
  cwd node['uchiwa-build']['workdir']
  user 'root'
  code <<-EOH
    export AMAZON_ACCESS_KEY_ID=#{node['uchiwa-build']['s3_amazon_access_key_id']}
    export AMAZON_SECRET_ACCESS_KEY=#{node['uchiwa-build']['s3_amazon_secret_access_key']}
    deb-s3 upload #{gpg_opts} --preserve-versions --bucket=#{node['uchiwa-build']['s3_bucket']} \
      --codename=#{node['uchiwa-build']['s3_debian_codename']} --component=main --use-ssl \
      `ls -1 *.deb`
  EOH
end
