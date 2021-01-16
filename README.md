# Tiket Test
Simple Web Automation on https://www.tiket.com/ using Ruby and cucumber
​
## Setup
​
### Dependencies
- RVM
- Ruby 2.5.1
- Git
- Bundler
- Chrome
​
### Install RVM & Ruby
1. RVM
​
  ```
  curl -L get.rvm.io | bash -s stable
  source ~/.bash_profile
  ```
​
  Then run `rvm requirements` and follow the instructions
​
2. Ruby 2.5.1
​
  ```
  rvm install 2.5.1
  ```
​
## Setup Gem
​
  ```
    rvm use 2.5.1@tiket-test --create
    gem install bundler
    bundle install
  ```

## Run the Test

  ```
    cp env.sample .env
    cucumber --tags @@web-automation
  ```