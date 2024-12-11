import { createRouter, createWebHistory, Router, RouteRecordRaw } from 'vue-router';

import Home from '@/views/Home.vue';
import NotFound from '@/views/404.vue';

const routes: Array<RouteRecordRaw> = [
  {
    component: Home,
    path: '/',
    name: 'Home',
    meta: { title: 'Home' },
  },
  { component: NotFound, path: '/error/404' },
  {
    path: '/:catchAll(.*)',
    redirect: '/error/404',
  },
];

const router: Router = createRouter({
  history: createWebHistory(),
  routes,
});

router.afterEach((to) => {
  const baseTitle = '';
  document.title = `${baseTitle} ${to.meta.title}`;
});

export default router;
