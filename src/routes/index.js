const express = require('express');

const homeRoute = require('../home/home.route');
const authRoute = require('../auth/auth.route');
const adminRoute = require('../admin/admin.route');
const userRoute = require('../user/user.route');
const thirdPartyRoute = require('../third-party/third-party.route');

const router = express.Router();

const routes = [
  {
    path: '/',
    route: homeRoute,
  },
  {
    path: '/auth',
    route: authRoute,
  },
  {
    path: '/admin',
    route: adminRoute,
  },
  {
    path: '/user',
    route: userRoute,
  },
  {
    path: '/position',
    route: thirdPartyRoute,
  },
];

routes.forEach((route) => {
  router.use(route.path, route.route);
});

module.exports = router;
