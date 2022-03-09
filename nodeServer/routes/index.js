var express = require('express');
const axios = require('axios');

var router = express.Router();

const axiosClient = axios.create({
  baseURL: 'https://gitlab.com/'
})

router.get('/:userId', async function(req, res) {
  try {
    const serverRes = await axiosClient.get(`${req.params.userId}`);
    res.send(serverRes.data);
  } catch (error) {
    console.error(error);
  }
});

router.post('/new-message', async function(req, res){
  try {
    const serverRes = await axiosClient.post('new-message',
    req.body, 
    {
      headers: {
        'Content-Type': 'application/json'
      }
    });
    res.send('data sent to server');
  } catch (error) {
    console.error(error);
  }
});
module.exports = router;
