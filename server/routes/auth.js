const router = require("express").Router();
const userModel = require("../models/user");

router.post("/signup", (req, res) => {
  const data = req.body;
  console.log(data);
  const user = new userModel(data);
  user.save((err, result) => {
    // save the user
    if (err) {
      res.status(400).send(err);
    } else {
      res.status(200).send(result);
    }
  });
});

router.post("/login", (req, res, next) => {
  const data = req.body;
  console.log(req.body);
  console.log(data);
  userModel.findOne(
    { emailID: data.emailID, password: data.password },
    (err, user) => {
      if (err) {
        res.status(400).send(err);
      } else {
        res.status(200).send(user);
      }
    }
  );
});

module.exports = router;
