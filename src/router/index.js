import { createRouter, createWebHistory } from "vue-router";

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: "/home",
            name: "home",
            component: ()=> import("../views/HomeView.vue"),
        },
        {
            path: "/about",
            name: "about",
            // route level code-splitting
            // this generates a separate chunk (About.[hash].js) for this route
            // which is lazy-loaded when the route is visited.
            component: () => import("../views/AboutView.vue"),
        },
        {
            path: "/login",
            name: "login",
            component: () => import("../views/LoginView.vue"),
        },
        {
            path: "/manageinventory",
            name: "manageinventory",
            component: () => import("../views/ManageInventory.vue"),
            children:
            [
                {
                    path: "add",
                    component: () => import("../views/Inventory/AddStock/ShowStockvView.vue"),
                    children:
                    [
                        {
                            path: "can",
                            component: () => import("../views/Inventory/AddStock/CanView.vue"),
                        },
                        {
                            path: "detergent",
                            component: () => import("../views/Inventory/AddStock/DetergentView.vue"),
                        },
                        {
                            path: "drink",
                            component: () => import("../views/Inventory/AddStock/DrinkView.vue"),
                        },
                        {
                            path: "spice",
                            component: () => import("../views/Inventory/AddStock/SpiceView.vue"),
                        },
                        {
                            path: "bread",
                            component: () => import("../views/Inventory/AddStock/BreadView.vue"),
                        },
                        {
                            path: "sauce",
                            component: () => import("../views/Inventory/AddStock/SauceView.vue"),
                        },
                        {
                            path: "food",
                            component: () => import("../views/Inventory/AddStock/FoodView.vue"),
                        },
                        {
                            path: "tool",
                            component: () => import("../views/Inventory/AddStock/ToolView.vue"),
                        },
                    ]
                },
                {
                    path: "delete",
                    component: () => import("../views/Inventory/Delete/ShowStockvView.vue"),
                    children:
                    [
                        {
                            path: "can",
                            component: () => import("../views/Inventory/Delete/CanView.vue"),
                        },
                        {
                            path: "detergent",
                            component: () => import("../views/Inventory/Delete/DetergentView.vue"),
                        },
                        {
                            path: "drink",
                            component: () => import("../views/Inventory/Delete/DrinkView.vue"),
                        },
                        {
                            path: "spice",
                            component: () => import("../views/Inventory/Delete/SpiceView.vue"),
                        },
                        {
                            path: "bread",
                            component: () => import("../views/Inventory/Delete/BreadView.vue"),
                        },
                        {
                            path: "sauce",
                            component: () => import("../views/Inventory/Delete/SauceView.vue"),
                        },
                        {
                            path: "food",
                            component: () => import("../views/Inventory/Delete/FoodView.vue"),
                        },
                        {
                            path: "tool",
                            component: () => import("../views/Inventory/Delete/ToolView.vue"),
                        },
                    ]
                },
                {
                    path: "update",
                    component: () => import("../views/Inventory/Update/ShowStockvView.vue"),
                    children:
                    [
                        {
                            path: "can",
                            component: () => import("../views/Inventory/Update/CanView.vue"),
                        },
                        {
                            path: "detergent",
                            component: () => import("../views/Inventory/Update/DetergentView.vue"),
                        },
                        {
                            path: "drink",
                            component: () => import("../views/Inventory/Update/DrinkView.vue"),
                        },
                        {
                            path: "spice",
                            component: () => import("../views/Inventory/Update/SpiceView.vue"),
                        },
                        {
                            path: "bread",
                            component: () => import("../views/Inventory/Update/BreadView.vue"),
                        },
                        {
                            path: "sauce",
                            component: () => import("../views/Inventory/Update/SauceView.vue"),
                        },
                        {
                            path: "food",
                            component: () => import("../views/Inventory/Update/FoodView.vue"),
                        },
                        {
                            path: "tool",
                            component: () => import("../views/Inventory/Update/ToolView.vue"),
                        },
                    ]
                },
            ]
        },
        {
            path: "/registerproduct",
            name: "registerproduct",
            component: () => import("../views/RegisterProductView.vue"),
        },
        {
            path: "/updateproduct",
            name: "updateproduct",
            component: () => import("../views/UpdateProductView.vue"),
        },
        {
            path: "/showstock",
            name: "showstock",
            component: () => import("../views/ShowStockvView.vue"),
        },
        {
            path: "/listitem",
            name: "listitem",
            component: () => import("../views/ListItemView.vue"),
            children:[
                {
                    path: "can",
                    component: () => import("../views/CanView.vue"),
                },
                {
                    path: "detergent",
                    component: () => import("../views/DetergentView.vue"),
                },
                {
                    path: "drink",
                    component: () => import("../views/DrinkView.vue"),
                },
                {
                    path: "spice",
                    component: () => import("../views/SpiceView.vue"),
                },
                {
                    path: "bread",
                    component: () => import("../views/BreadView.vue"),
                },
                {
                    path: "sauce",
                    component: () => import("../views/SauceView.vue"),
                },
                {
                    path: "food",
                    component: () => import("../views/FoodView.vue"),
                },
                {
                    path: "tool",
                    component: () => import("../views/ToolView.vue"),
                }
            ]
        },
        {
            path: "/cashier",
            name: "cashier",
            component: () => import("../views/CashierView.vue"),
        },
        {
            path: "/closesale",
            name: "closesale",
            component: () => import("../views/CloseSaleView.vue"),
        },
    ],
    // linkActiveClass is for router-link classname in that particular router
    linkActiveClass: "routerlink-active-link",
});

export default router;

