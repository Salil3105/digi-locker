const router = require("express").Router();
const multer = require("multer");
const upload = multer({ dest: "FilesUplod/" });

const fileModel = require("../models/file");

// Here we are using multer to upload the file which will be stored in the server. 
// Here we are using the destination as "FilesUplod" and the file name will be the same as the original file name.
router.post("/uploadFile", upload.single("image"), function (req, res) {
    const data = req.file;
    console.table(data);
    const file = new fileModel(data);
    file.save((err, result) => {
        if (err) {
            console.log('Error');
            res.status(400).send(err);
        } else {
            console.log('Success');
            res.status(200).send(result);
        }
    });
});

module.exports = router;