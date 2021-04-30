# What is?

An attempt at creating a reproducible environment that will return consistent [web vital](https://web.dev/vitals/) metrics.

# Why?

The QA environments are behind a VPN, external sites can't reach them to test.

Running lighthouse in Chrome returns a different score every time you run it against the QA environments. You may get 
within a range of results, someone else on a different machine will likely get a totally different range.
This makes it useless when you want to know what affect your code changes have had.

# Setup

```
vagrant up
```

# Run the things

```
vagrant ssh
cd /sitespeed
./sitespeed.sh <url>
```

# How bad is it?

Results for the tests will be synced into `<project root>/sitespeed-result`

- Open `index.html` from your test results.
- From the top navigation click `pages`
- Click the URL you tested in the table
- Scroll down a bit and you'll see something like the screenshot below - this is the best bit to use as a comparison with other results

<img width="1049" alt="Screenshot 2021-04-30 at 10 33 03" src="https://user-images.githubusercontent.com/55099878/116677919-ab602b00-a9a0-11eb-8aa4-8360b8a70254.png">


# Reasons

This is run inside a vagrant VM because the BJSS macs don't allow `sudo` which is a requirement for
[Throttle](https://github.com/sitespeedio/throttle) to function.

Instead a docker network is created inside the VM and throttled with `tc`

The test will run for 20 iterations, hitting the QA sites will occasionally be very slow, 20 iterations stops this 
affecting the average score too much.

# Improvements

Find a better way (consistent no matter what machine it is run on) to throttle CPU usage

Sitespeed has a lot of [config options](https://www.sitespeed.io/documentation/sitespeed.io/configuration/#the-options) to play around with.

Ideally this could be triggered by Jenkins or similar and the results automatically uploaded to S3
