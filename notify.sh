#/bin/bash

cwd=`dirname "${0}"`

TOKEN=`cat $cwd/slack_token.txt`
BASE_URL='https://slack.com/api'

auth_test() {
    curl -XPOST $BASE_URL/auth.test \
    -d "token=$TOKEN" -d "pretty=1"
}

post_message() {
    TEXT=$@
    curl -XPOST $BASE_URL/chat.postMessage \
    -d "token=$TOKEN"\
    -d "channel=notice"\
    --data-urlencode "text=$TEXT"\
    -d "user_name='issun'"\
    -d "as_user=true"
}

#auth_test
post_message $1
