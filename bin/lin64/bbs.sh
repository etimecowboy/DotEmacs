#!/usr/bin/expect

spawn luit -encoding gbk telnet newsmth.net

interact {
timeout 180 { send “\014″ } #防掉线
}
