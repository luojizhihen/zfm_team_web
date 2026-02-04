import { createRouter, createWebHistory } from 'vue-router';
import Publish from '../views/Publish.vue';
import Hall from '../views/Hall.vue';
import My from '../views/My.vue';

const routes = [
    { path: '/', redirect: '/publish' },
    { path: '/publish', name: 'Publish', component: Publish },
    { path: '/hall', name: 'Hall', component: Hall },
    { path: '/my', name: 'My', component: My },
    { path: '/admin/users', name: 'AdminUsers', component: () => import('../views/AdminUsers.vue') },
    { path: '/auth', name: 'Auth', component: () => import('../views/Auth.vue') }
];

const router = createRouter({
    history: createWebHistory('/zfm_team_web/'),
    routes
});

export default router;
