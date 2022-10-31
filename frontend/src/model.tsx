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
    categoryId: string
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
    quantity: Number,
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
    price: Number,
    product: Product,
    title: string
}