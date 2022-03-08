var express = require('express');
const axios = require('axios')

var router = express.Router();

router.get('/:userId', async function(req, res) {
  axios
  .get(`https://${req.params.userId}`)
  .then(serverRes => {
    res.send(serverRes.data);
  })
  .catch(error => {
    console.error(error)
  })
});

router.post('/:userId', async function(req, res){
  const serverRes = await axios.post('<https://test.org/post>', req.body, {
  headers: {
    'Content-Type': 'application/json'
  }
});

res.send('data sent to server');
});
module.exports = router;
