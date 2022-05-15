// imports 
const express = require("express");
const multer = require("multer");
const router = express.Router();

const fileStorageEngine = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, "FilesUplod/");  // here we are storing the file in the server.
    },
    filename: (req, file, cb) => {
        cb(null, file.originalname);
    }
});

const upload = multer({
    storage: fileStorageEngine,
});

// Here we are using multer to upload the file which will be stored in the server.
// Here we are using the destination as "FilesUplod" and the file name will be the same as the original file name.
// upload.uploadSingleFile("image") is used to upload the file And that is the middleware for multer.
// upload.uploadSingleFile("image") where 'image' is the name of the input field in the form.
router.post('/uploadSingleFile', upload.single('image'), (req, res) => {
    if (res.status(200)) {
        const data = req.file;
        console.log(data);
        res.send('File Uploaded Successfully');
    }else {
        res.send(res.send('File failed to upload').status(400));
    }
});

//  Here we are using multer to upload the file which will be stored in the server.
//  Here we are using the destination as "FilesUplod" and the file name will be the same as the original file name.
//  upload.array("images",10) is used to upload the file And that is the middleware for multer.
//  upload.array("images",10) where 'images' is the name of the input field in the form.
//  upload.array("images",10) where '10' is the minimum number of files that can be uploaded.
router.post('/uploadMultipleFiles', upload.array('image', 10), (req, res) => {
    if (res.status(200)) {
        const data = req.files;
        console.log(data);
        res.send('Files Uploaded Successfully');
    }else {
        res.send(res.send('Files failed to upload').status(400));
    }
});

module.exports = router;
