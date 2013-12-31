crypto = undefined
makeRequireJSConfig = undefined
scrypts = undefined
crypto = require("crypto")
scrypts = require("scrypt")
makeRequireJSConfig = require("../libs/makeRequireJSconfig")
module.exports = (app) ->
  app.get "/", (req, res) ->
    requireJSConfig = undefined
    requireJSConfig = makeRequireJSConfig()
    res.render "main",
      requireJSConfig: requireJSConfig


  app.post "/hash/md5", (req, res) ->
    md5sum = undefined
    md5sum = crypto.createHash("md5")
    md5sum.update req.body.input
    res.send hash: md5sum.digest("hex")

  app.post "/hash/sha1", (req, res) ->
    md5sum = undefined
    md5sum = crypto.createHash("sha1")
    md5sum.update req.body.input
    res.send hash: md5sum.digest("hex")

  app.post "/hash/sha256", (req, res) ->
    md5sum = undefined
    md5sum = crypto.createHash("sha256")
    md5sum.update req.body.input
    res.send hash: md5sum.digest("hex")

  app.post "/hash/scrypt", (req, res) ->
   # Scrypt password hash with N=1024 may takes 25 min to generate encryption code
    scrypts.passwordHash(req.body.input, 0.3, 1, 1, (err, pwdhash) ->
      res.send hash: pwdhash
      "pwdhash"
    )
    
