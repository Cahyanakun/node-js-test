const express = require('express');
const { authAdmin } = require('../middlewares/auth.meddleware');
const thirdPartyController = require('./third-party.controller');

const router = express.Router();

router.get('/', authAdmin(), thirdPartyController.list);
router.get('/:id', authAdmin(), thirdPartyController.show);

module.exports = router;
