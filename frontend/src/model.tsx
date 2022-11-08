export enum Roles {
    Admin = 1,
    User = 2
}

export interface Post {
    title: string,
    postDescription: string,
    imageUrl: string,
    accountId: string,
    price: Number,
    buildingId: string,
    productName: string,
    productDescription: string,
    quantity: Number,
    categoryId: string,
}

export interface Category {
    id: string;
    name: string;
    icon: string;
}

export interface Product {
    id: string,
    name: string,
    price: Number,
    description: string,
    quantity: number,
    dimensions: string,
    categoryId: string,
}

export interface Building {
    address: string,
    id: string,
    name: string
}

export interface PostShow {
    accountId: string,
    building: Building,
    buildingId: string,
    description: string,
    id: string,
    imageUrl: string,
    price: number,
    product: Product,
    title: string
}

export interface ProductCheckout {
    id: string;
    quantity: number;
}

export interface cartItem {
    post: PostShow;
    quantity: number;
}

export const getTotal = (cart: cartItem[]) => {
    let total = 0;
    cart?.forEach(item => {
        total += item.quantity * item.post.price;
    });
    return total;
}

export const getProducts = (cart: cartItem[]) => {
    let products: ProductCheckout[] = [];
    cart?.forEach(item => {
        products.push({
            id: item.post.id,
            quantity: item.quantity
        })
    });
    return products;
}

export interface cartList {
    id: string,
    quantity: number,
}

export interface checkoutForm {
    accountId: string;
    walletId: string;
    description: string;
    transactionType: string;
    cartList: cartList[];
}

export interface editProfile {
    id: string;
    password: string;
    fullName: string;
    description: string;
    phone: string;
    gender: string;
    avatarUrl: string;
    buildingId: string;
}

export interface User {
    id: string;
    fullName: string;
    description: string;
    phone: string;
    gender: string;
    avatarUrl: string;
    building: Building;
    role: string;
    status: boolean;
    jwtToken: string;
}