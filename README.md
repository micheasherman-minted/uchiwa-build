## Uchiwa Build

This project builds packages for Uchiwa, a Sensu dashboard.
Vagrant, Test-Kitchen and ServerSpec are used to create and test the packages.

The RPM and DEB packages are built on CentOS 6.5 x86_64, which cross-compile the Uchiwa binary to 32 & 64 bits.

The packages are tested on the following platforms:
- CentOS 5.11 x86_64
- CentOS 6.5 x86_64
- CentOS 6.5 i386
- Ubuntu 10.04 amd64
- Ubuntu 12.04 amd64
- Ubuntu 14.04 amd64
- Ubuntu 14.04 i386

### Run

```
export UCHIWA_VERSION=0.3.0
export BUILD_NUMBER=1
export UCHIWA_GIT='github.com/sensu/uchiwa'
export S3_BUCKET=s3_apt_repo
cp -Rp $HOME/.gnupg ./
export S3_GPG_SIGN=true
export S3_AMAZON_ACCESS_KEY_ID=..
export S3_AMAZON_SECRET_ACCESS_KEY=...
export S3_DEBIAN_CODENAME=precise
kitchen converge build
kitchen destroy build
kitchen test test
kitchen converge s3-upload
kitchen destroy s3-upload
```
