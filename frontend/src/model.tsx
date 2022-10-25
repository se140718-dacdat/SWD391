export enum Roles {
    Admin = 1,
    User = 2
}

export interface Post {
    ID: string,
    Title: string,
    Description: string,
    ImageUrl: string,
    Status: boolean,
    price: Number,
    BuildingID: string
}